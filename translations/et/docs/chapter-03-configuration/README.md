# Chapter 3: Konfiguratsioon & Autentimine

**📚 Kursus**: [AZD Algajatele](../../README.md) | **⏱️ Kestus**: 45-60 minutit | **⭐ Tase**: Kesktase

---

## Ülevaade

Selles peatükis käsitletakse keskkonna konfiguratsiooni, autentimismustreid ja Azure Developer CLI juurutuste turvalisi tavasid.

> Kinnitatud `azd 1.23.12` vastu märtsis 2026.

## Õpieesmärgid

Selle peatüki läbimisega:
- Valdad AZD konfiguratsiooni hierarhiat
- Halda mitut keskkonda (arendus, testimine, tootmine)
- Rakenda turvalist autentimist hallatud identiteetidega
- Konfigureeri keskkonnapõhised seadistused

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|----------|-----------|-----|
| 1 | [Konfiguratsiooni juhend](configuration.md) | Keskkonna seadistus ja haldus | 30 min |
| 2 | [Autentimine & turvalisus](authsecurity.md) | Hallatud identiteedi ja RBAC mustrid | 30 min |

---

## 🚀 Kiire algus

```bash
# Loo mitu keskkonda
azd env new dev
azd env new staging
azd env new prod

# Vaheta keskkondi
azd env select prod

# Sea keskkonnamuutujad
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Vaata konfiguratsiooni
azd env get-values
```

---

## 🔧 Konfiguratsiooni hierarhia

AZD rakendab seadistusi selles järjekorras (hilisem kirjutab varasema üle):

1. **Vaikimisi väärtused** (mallides sisse ehitatud)
2. **azure.yaml** (projekti konfiguratsioon)
3. **Keskkonnamuutujad** (`azd env set`)
4. **Käsurea lipud** (`--location eastus`)

---

## 🔐 Turvalised tavad

```bash
# Kasuta hallatud identiteeti (soovitatav)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Kontrolli AZD autentimise olekut
azd auth status

# Valikuline: kontrolli Azure CLI konteksti, kui plaanid käivitada az käske
az account show

# Autendi uuesti, kui vaja
azd auth login

# Valikuline: uuenda Azure CLI autentimist az käskude jaoks
az login
```

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-------|---------|
| **Eelmine** | [Peatükk 2: Tehisintellekti arendus](../chapter-02-ai-development/README.md) |
| **Järgmine** | [Peatükk 4: Taristu](../chapter-04-infrastructure/README.md) |

---

## 📖 Seotud ressursid

- [Enne juurutamist tehtavad kontrollid](../chapter-06-pre-deployment/README.md)
- [Tõrkeotsing](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame täpsust, palun pidage meeles, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument oma emakeeles tuleks pidada autoriteetseks allikaks. Tähtsa teabe puhul soovitatakse professionaalset inimtõlget. Me ei võta vastutust selle tõlke kasutamisest tingitud arusaamatuste või väärtõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->