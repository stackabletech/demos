#!/usr/bin/env python

import os
import subprocess
import yaml
from typing import Tuple, Set
from textwrap import dedent


def run_helm_repo_add(repo_name: str, repo_url: str) -> None:
    result = subprocess.run(
        ["helm", "repo", "add", repo_name, repo_url, "--force-update"],
        capture_output=True,
        check=True,
    )
    if result.returncode == 0:
        print(f"✅ Added/Updated {repo_name} ({repo_url})")
    else:
        print(
            f"⚠️ There was a problem Adding/Updating {repo_name} ({repo_url}): {result.stderr}"
        )


def local_repo_list():
    result = subprocess.run(
        ["helm", "repo", "list", "-o", "yaml"],
        capture_output=True,
        text=True,
        check=True,
    )
    return yaml.safe_load(result.stdout)


def get_chart_and_app_version(repo_name: str, chart_name: str) -> Tuple[str, str]:
    full_chart = f"{repo_name}/{chart_name}"
    result = subprocess.run(
        ["helm", "show", "chart", full_chart],
        capture_output=True,
        text=True,
        check=True,
    )
    chart_yaml = yaml.safe_load(result.stdout)
    # Some charts don't have an appVersion and as such we fallback to a default
    # value to not cause lookup errors.
    return chart_yaml["version"], chart_yaml.setdefault("appVersion", "Not present")


def process_yaml_files(top_dir: str) -> None:
    seen_repos: Set[str] = set()
    local_repos = local_repo_list()

    for root, _, files in os.walk(top_dir):
        for file in files:
            if not file.endswith(".yaml"):
                continue

            filepath = os.path.join(root, file)

            try:
                with open(filepath, "r") as f:
                    raw_lines = f.readlines()

                try:
                    first_doc = yaml.safe_load("".join(raw_lines))
                except yaml.YAMLError as e:
                    if "expected a single document" in str(e):
                        continue  # silently skip multi-doc YAMLs
                    print(f"⚠️ Skipping invalid YAML: {filepath}")
                    continue

                if not isinstance(first_doc, dict):
                    continue

                if not (
                    "releaseName" in first_doc
                    and "version" in first_doc
                    and "repo" in first_doc
                    and "name" in first_doc
                ):
                    continue

                repo_info = first_doc["repo"]
                chart_name = first_doc["name"]
                repo_name = repo_info.get("name")
                repo_url = repo_info.get("url")

                if not repo_name or not repo_url:
                    continue

                # At this point, it appears to be a Helm Chart manifest.

                # Skip Vector, as we currently keep it tied to the version that the product sidecars use.abs
                # Looking forward to swapping the transport with OTLP.
                if chart_name == "vector":
                    raise Exception(
                        "Skipping vector. Ensure it is at the same version as the product sidecars"
                    )
                    continue

                chart_version = first_doc["version"]
                # Skip chart versions which seem to be templated.
                if chart_version.startswith("{{"):
                    continue

                local_repo = next(
                    (repo for repo in local_repos if repo["name"] == repo_name), None
                )
                if local_repo is not None:
                    local_repo_url = local_repo["url"]
                    if local_repo_url != repo_url:
                        raise Exception(
                            dedent(f"""
                            You have a local repo named {repo_name} pointing to {local_repo_url}, but the stack/demo wants {repo_url}
                            Either delete or update your local repo URL, or update the stack/demo repo name so it doesn't conflict
                        """)
                        )

                if repo_name not in seen_repos:
                    run_helm_repo_add(repo_name, repo_url)
                    seen_repos.add(repo_name)

                # print(f"📦 Updating {filepath} -> {repo_name}/{chart_name}")
                new_chart_version, new_app_version = get_chart_and_app_version(
                    repo_name, chart_name
                )

                updated_lines = []
                for line in raw_lines:
                    if line.startswith("version:"):
                        new_line = f"version: {new_chart_version} # appVersion: {new_app_version}\n"
                        updated_lines.append(new_line)
                    else:
                        updated_lines.append(line)

                with open(filepath, "w") as f:
                    f.writelines(updated_lines)

                print(f"✅ Updated {filepath}")

            except Exception as e:
                # If debugging, you can get the exception line number like this:
                # _, _, tb = os.sys.exc_info()
                # lineno = tb.tb_lineno
                print(f"⚠️ Error processing {filepath}: {e}")


if __name__ == "__main__":
    print(
        dedent("""
            ⚠️⚠️⚠️ This script is best-effort! Always check the result using "git diff"! ⚠️⚠️⚠️
            Notably, it skips invalid YAMLs, which can be the case because we sometimes use templating syntax, even for helm-chart definitions.
            In those cases, use quotes around templated values, or otherwise comments for templated blocks.

            Please judge on the skipped files if they contain a helm-chart and should be manually bumped.
            The script can be improved to handle such files in the future.
        """)
    )

    process_yaml_files(".")
