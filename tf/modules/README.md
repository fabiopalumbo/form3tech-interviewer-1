# Modules directory

# How do you use this Module?
This repo has the following structure:

modules: This folder contains several standalone, reusable, production-grade modules that you can use to deploy Vault.
examples: This folder shows examples of different ways to combine the modules in the modules folder to deploy Vault.
test: Automated tests for the modules and examples.
root folder: The root folder is an example of how to use the vault- module to deploy a Vault  in AWS. The Terraform Registry requires the root of every repo to contain Terraform code, so we've put one of the examples there. This example is great for learning and experimenting, but for production use, please use the underlying modules in the modules folder directly.