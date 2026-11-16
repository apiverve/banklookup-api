from setuptools import setup, find_packages

import os
lib_folder = os.path.dirname(os.path.realpath(__file__))
requirements_file = os.path.join(lib_folder, 'requirements.txt')
install_requires = ["requests >= 2.25.1", "setuptools >= 56.0.0"]
if os.path.exists(requirements_file):
    with open(requirements_file, 'r') as f:
        install_requires = f.read().splitlines()

setup(
    name='apiverve_banklookup',
    version='1.2.6',
    packages=find_packages(),
    include_package_data=True,
    install_requires=install_requires,
    description='Bank Lookup is a bank and credit union lookup API covering every FDIC-insured institution ever chartered and every federally insured credit union. Search by name, FDIC certificate, NCUA charter, routing number, SWIFT code, LEI, website domain or IBAN and get the status, headquarters, regulator and identifiers, while paid plans add the successor of merged charters, failure details, the LEI, assets, deposits, members and full branch lists.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/banklookup?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)