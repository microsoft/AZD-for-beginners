# Peatükk 3: Konfiguratsioon ja Autentimine

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Kestus**: 45-60 minutit | **⭐ Keerukus**: Keskmine

---

## Ülevaade

See peatükk käsitleb keskkonna konfiguratsiooni, autentimisstrateegiaid ja turvalisuse parimaid tavasid Azure Developer CLI juurutuste jaoks.

## Õpieesmärgid

By completing this chapter, you will:
- Valda AZD konfiguratsiooni hierarhiat
- Halda mitut keskkonda (dev, staging, prod)
- Rakenda turvaline autentimine, kasutades hallatud identiteete
- Konfigureeri keskkonnapõhised seaded

---

## 📚 Õppetunnid

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Konfiguratsiooni juhend](configuration.md) | Keskkonna seadistamine ja haldamine | 30 min |
| 2 | [Autentimine & Turvalisus](authsecurity.md) | Hallatud identiteedi ja RBAC mustrid | 30 min |

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

AZD rakendab seadistusi selles järjekorras (hilisemad kirjutavad varasemaid üle):

1. **Vaikeväärtused** (mallidesse sisse ehitatud)
2. **azure.yaml** (projekti konfiguratsioon)
3. **Keskkonnamuutujad** (`azd env set`)
4. **Käsurea lipud** (`--location eastus`)

---

## 🔐 Turvalisuse parimad tavad

```bash
# Kasuta hallatud identiteeti (soovitatav)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Kontrolli autentimise olekut
azd auth whoami
az account show

# Autenteeri uuesti vajadusel
azd auth login
az login
```

---

## 🔗 Navigatsioon

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [Peatükk 2: AI arendus](../chapter-02-ai-development/README.md) |
| **Järgmine** | [Peatükk 4: Infrastruktuur](../chapter-04-infrastructure/README.md) |

---

## 📖 Seotud ressursid

- [Kontrollid enne juurutamist](../chapter-06-pre-deployment/README.md)
- [Tõrkeotsing](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Lahtiütlus:
Seda dokumenti on tõlgitud tehisintellektil põhineva tõlketeenuse Co-op Translator (https://github.com/Azure/co-op-translator) abil. Kuigi me püüame tagada täpsust, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Algset dokumenti selle originaalkeeles tuleks pidada autoriteetseks allikaks. Kriitilise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste ega valesti tõlgendamise eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->