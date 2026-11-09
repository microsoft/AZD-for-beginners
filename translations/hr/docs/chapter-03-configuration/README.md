# Poglavlje 3: Konfiguracija i autentikacija

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 90-150 minuta uključujući praksu integracije | **⭐ Kompleksnost**: Srednja

---

## Pregled

Ovo poglavlje pokriva konfiguraciju okruženja, obrasce autentikacije i najbolje sigurnosne prakse za Azure Developer CLI implementacije.

> Pregled naredbi i konfiguracije cilj: `azd 1.37.2` (studeni 2026.). Nije izvršena stvarna Azure provisija tijekom pregleda.

## Ciljevi učenja

Završetkom ovog poglavlja ćete:
- Savladati hijerarhiju konfiguracije AZD-a
- Upravljati s više okruženja (dev, staging, prod)
- Implementirati sigurnu autentikaciju pomoću upravljanih identiteta
- Konfigurirati postavke specifične za okruženje

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Vodič za konfiguraciju](configuration.md) | Postavljanje i upravljanje okruženjem | 30 min |
| 2 | [Autentikacija i sigurnost](authsecurity.md) | Obrasci upravljanih identiteta i RBAC-a | 30 min |

---

## 🚀 Brzi početak

Pokrenite iz korijena **već inicijalizirane azd aplikacije**, a ne iz repozitorija tečaja. Koristite neiskorištena imena okruženja ako ova već postoje.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` je ilustrativan: utječe na infrastrukturu samo ako ga vaš predložak eksplicitno koristi. Uobičajene vrijednosti `azd env set` se spremaju lokalno u običnom tekstu; nisu sigurna pohrana tajni.

---

## 🔧 Hijerarhija konfiguracije

Držite tri različite površine konfiguracije odvojeno: globalne postavke (`azd config`), strukturu projekta (`azure.yaml`), i vrijednosti po okruženju (`azd env`). Zastavice nadjačavaju samo one postavke koje zapravo podržavaju; ne postoji univerzalni sloj proizvoljnih varijabli okruženja preko `azure.yaml` ili Bicep-a.

---

## 🔐 Najbolje sigurnosne prakse

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 2: AI razvoj](../chapter-02-ai-development/README.md) |
| **Sljedeće** | [Poglavlje 4: Infrastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Povezani resursi

- [Provjere prije implementacije](../chapter-06-pre-deployment/README.md)
- [Rješavanje problema](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->