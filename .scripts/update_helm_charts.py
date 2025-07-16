#!/usr/bin/env python

import os
import subprocess
import yaml
from typing import Tuple, Set


def run_helm_repo_add(repo_name: str, repo_url: str) -> None:
    try:
        subprocess.run(["helm", "repo", "add", repo_name, repo_url], check=True)
    except subprocess.CalledProcessError as e:
        if "already exists" in e.stderr.decode() if e.stderr else str(e):
            pass  # Ignore "already exists" error
        else:
            raise


def run_helm_repo_update() -> None:
    subprocess.run(["helm", "repo", "update"], check=True)


def get_chart_and_app_version(repo_name: str, chart_name: str) -> Tuple[str, str]:
    full_chart = f"{repo_name}/{chart_name}"
    result = subprocess.run(
        ["helm", "show", "chart", full_chart],
        capture_output=True,
        text=True,
        check=True
    )
    chart_yaml = yaml.safe_load(result.stdout)
    return chart_yaml["version"], chart_yaml["appVersion"]


def process_yaml_files(top_dir: str) -> None:
    seen_repos: Set[str] = set()

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

                if repo_name not in seen_repos:
                    run_helm_repo_add(repo_name, repo_url)
                    seen_repos.add(repo_name)

                # print(f"📦 Updating {filepath} -> {repo_name}/{chart_name}")
                new_chart_version, new_app_version = get_chart_and_app_version(repo_name, chart_name)

                updated_lines = []
                for line in raw_lines:
                    if line.strip().startswith("version:"):
                        new_line = f'version: {new_chart_version} # {new_app_version}\n'
                        updated_lines.append(new_line)
                    else:
                        updated_lines.append(line)

                with open(filepath, "w") as f:
                    f.writelines(updated_lines)

                print(f"✅ Updated {filepath}")

            except Exception as e:
                print(f"⚠️ Error processing {filepath}: {e}")

if __name__ == "__main__":
    print('⚠️⚠️⚠️ This script is best-effort! Always check the result using "git diff"! ⚠️⚠️⚠️')
    print('Notably, it skips invalid YAMLs, which can be the case because we sometimes use templating syntax, even for helm-chart definitions')
    print('Please judge on the skipped files if they contain a helm-chart and should be manually bumped')
    print('The script can be improved to handle such files in the future')
    print()

    process_yaml_files(".")
