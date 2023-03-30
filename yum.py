import subprocess

# run the "yum -q check-update" command and capture the output
output = subprocess.check_output(['yum', '-q', 'check-update'])

# split the output into lines and skip the header
lines = output.decode().split('\n')[1:]

# iterate over the lines and extract the package name, version, and architecture
packages = []
for line in lines:
    fields = line.split()
    if len(fields) >= 2:
        name, version = fields[0].split('.')
        arch = fields[1]
        packages.append(f"{name}.{version}.{arch}")

# print the list of packages
for package in packages:
    print(package)
