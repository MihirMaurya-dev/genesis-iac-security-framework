<div align="center">

# 🛡️ Genesis: Enterprise Azure Terraform & Security Framework
### Modular Infrastructure as Code with Custom Gitleaks Rules, TFLint & Multi-Stage Pipelines

[![Platform](https://img.shields.io/badge/Platform-Microsoft_Azure-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com)
[![IaC](https://img.shields.io/badge/IaC-Terraform_Modular-7B2CBF?style=for-the-badge&logo=terraform&logoColor=white)](https://terraform.io)
[![Secret Scanning](https://img.shields.io/badge/Secrets-Custom_Gitleaks_Rules-00FF66?style=for-the-badge&logo=github&logoColor=0B0813)](#-custom-gitleaks-rules-in-gitleakstoml)
[![Linting](https://img.shields.io/badge/Linting-TFLint_Recursive-00E5FF?style=for-the-badge&logo=terraform&logoColor=0B0813)](#-verification-commands)

**Architected by [Mihir Maurya](https://github.com/MihirMaurya-dev) · Enterprise Cloud Architect & DevSecOps**

</div>

---

## 🏗️ Architectural Topology

The **Genesis Infrastructure Framework** is an enterprise-grade Terraform codebase engineered for Microsoft Azure. Designed with strict separation of concerns, the platform isolates foundation modules (`RG`, `VNET`, `SNET`, `PIP`, `VM`) and enforces automated pre-commit scanning to block committed credentials, cleartext passwords in `.tfvars`, and permissive network rules.

```mermaid
flowchart TD
    subgraph Modules["🧩 Genesis Foundation Modules"]
        RG["📁 RG: Resource Group Module"]
        VNET["🌐 VNET: Virtual Network Module"]
        SNET["⚡ SNET: Subnet & NSG Module"]
        PIP["📍 PIP: Standard Public IP Module"]
        VM["💻 VM: Azure Linux Virtual Machine Module"]
    end

    subgraph SecurityGates["🛡️ Shift-Left Security Pipeline"]
        GL["🔑 Gitleaks (.gitleaks.toml)\nRegex Secret & Password Gate"]
        TL["🔬 TFLint (Recursive Syntax)\nDeep AzureRM Provider Rules"]
        TV["🔭 Trivy Security Engine\nMisconfiguration & CVE Scans"]
    end

    subgraph Runtime["🚀 Azure Cloud Environment"]
        ENV["🧪 env/dev (Modular Deployment)\nDecoupled State & Remote Lock"]
    end

    Modules --> SecurityGates
    SecurityGates --> Runtime

    classDef modStyle fill:#1d0738,stroke:#9d4edd,stroke-width:2px,color:#fff;
    classDef secStyle fill:#032111,stroke:#00ff66,stroke-width:2px,color:#fff;
    classDef runStyle fill:#08182b,stroke:#00e5ff,stroke-width:2px,color:#fff;

    class Modules,RG,VNET,SNET,PIP,VM modStyle;
    class SecurityGates,GL,TL,TV secStyle;
    class Runtime,ENV runStyle;
```

---

## 🧰 Technology Stack & Tooling

<div align="center">

<a href="https://skillicons.dev">
  <img src="https://skillicons.dev/icons?i=azure,terraform,bash,powershell,git,githubactions,linux,vscode&theme=dark&perline=8" alt="Technology Stack" />
</a>

</div>

<br/>

---

## 📂 Repository Topology

```text
genesis-iac-security-framework/
├── .gitleaks.toml           # 🔑 Custom Gitleaks rule definitions
├── azure-pipelines.yml       # 🔄 Azure DevOps Multi-Stage Pipeline
├── env/
│   └── dev/                  # 🧪 Root environment deployment
│       ├── main.tf           # Module caller & dependency chaining
│       ├── providers.tf      # AzureRM provider configuration
│       ├── terraform.tfvars  # Input variables
│       └── variables.tf
│
└── modules/                  # 🧩 REUSABLE TERRAFORM MODULES
    ├── PIP/                  # Public IP allocation module
    ├── RG/                   # Resource Group & Tagging governance
    ├── SNET/                 # Subnet generator with NSG binding
    ├── VM/                   # Virtual Machine compute module
    └── VNET/                 # Virtual Network address space generator
```

---

## 🔑 Custom Gitleaks Rules in `.gitleaks.toml`

This framework uses custom regex rules specifically designed to detect passwords in `*.tfvars` and `*.tf` files that standard default rules miss:

```toml
title = "Optimized Gitleaks Configuration for Terraform"

[[rules]]
id = "terraform-cleartext-password"
description = "Detects hardcoded admin passwords in Terraform variable definitions"
regex = '''(?i)(?:admin_password|password|secret|access_key)\s*=\s*["'][^"']{4,}["']'''
tags = ["terraform", "credentials", "security"]
```

---

## ⚡ Local Verification Commands

```bash
# 1. Run custom Gitleaks secret detection
gitleaks detect --source . --config .gitleaks.toml --verbose

# 2. Run recursive TFLint rule enforcement
tflint --recursive

# 3. Scan configuration misconfigurations via Trivy
trivy config --tf-vars .\env\dev\terraform.tfvars .
```

---

<div align="center">

**[Portfolio](https://mihirmaurya-dev.github.io/)** · **[LinkedIn](https://linkedin.com/in/mihirmauryaa1)** · **[DevOps Knowledge Vault](https://github.com/MihirMaurya-dev/DevOps-Notes)**

</div>
