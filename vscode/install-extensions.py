import subprocess


def get_dotfiles_extensions():
    with open("./vscode/extensions") as f:
        lines = f.readlines()
        return [line.strip() for line in lines]


def get_installed_extensions():
    response = subprocess.run(
        " ".join(["code", "--list-extensions"]),
        capture_output=True,
        shell=True,
        text=True,
    )

    if response.stderr:
        print("Something went wrong fetching installed extensions")
        print(response.stderr)
        exit(1)

    return response.stdout.split("\n")


all_extensions = get_dotfiles_extensions()
installed_extensions = get_installed_extensions()
print(installed_extensions)

uninstalled_extensions = [
    item for item in all_extensions if item not in installed_extensions
]

for extension in uninstalled_extensions:
    subprocess.run(" ".join(["code", "--install-extension", extension]), shell=True)
print("All extensions are synced")
