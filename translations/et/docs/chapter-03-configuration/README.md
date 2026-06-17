# Chapter 3: Konfiguratsioon ja autentimine

**📚 Kursus**: [AZD alustajatele](../../README.md) | **⏱️ Kestus**: 45-60 minutit | **⭐ Raskusaste**: Kesktasemel

---

## Ülevaade

See peatükk käsitleb keskkonna seadistamist, autentimise mustreid ja turvalisuse parimaid tavasid Azure Developer CLI kasutuselevõtuks.

> Kontrollitud versiooniga `azd 1.25.6` juunis 2026.

## Õpieesmärgid

Selle peatüki lõpetamisel:
- Omandad AZD konfiguratsiooni hierarhia
- Haldate mitut keskkonda (dev, staging, prod)
- Rakendate turvalist autentimist hallatud identiteetidega
- Konfigureerite keskkonnaspetsiifilisi seadeid

---

## 📚 Õppetunnid

| # | Tund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Konfiguratsioonijuhend](configuration.md) | Keskkonna seadistamine ja haldus | 30 min |
| 2 | [Autentimine ja turvalisus](authsecurity.md) | Hallatud identiteedid ja RBAC mustrid | 30 min |

---

## 🚀 Kiire algus

```bash
# Loo mitu keskkonda
azd env new dev
azd env new staging
azd env new prod

# Vaheta keskkondi
azd env select prod

# Määra keskkonnamuutujad
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Vaata konfiguratsiooni
azd env get-values
```

---

## 🔧 Konfiguratsiooni hierarhia

AZD rakendab seadeid selles järjekorras (hilisemad kirjutavad eelnevaid üle):

1. **Vaikeväärtused** (mallidesse sisse ehitatud)
2. **azure.yaml** (projekti konfiguratsioon)
3. **Keskkonnamuutujad** (`azd env set`)
4. **Käsurea lipud** (`--location eastus`)

---

## 🔐 Turvalisuse parimad tavad

```bash
# Kasutage hallatud identiteeti (soovitatav)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Kontrollige AZD autentimise olekut
azd auth status

# Valikuline: kontrollige Azure CLI konteksti, kui kavatsete käivitada az käske
az account show

# Vajadusel autenduge uuesti
azd auth login

# Valikuline: värskendage Azure CLI autentimist az käskude jaoks
az login
```

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [Peatükk 2: AI arendus](../chapter-02-ai-development/README.md) |
| **Järgmine** | [Peatükk 4: Infrastruktuur](../chapter-04-infrastructure/README.md) |

---

## 📖 Seotud ressursid

- [Juurutuseelne kontroll](../chapter-06-pre-deployment/README.md)
- [Tõrkeotsing](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->