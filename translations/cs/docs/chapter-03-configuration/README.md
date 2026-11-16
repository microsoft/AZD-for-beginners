# Kapitola 3: Konfigurace a Autentizace

**📚 Kurz**: [AZD Pro Začátečníky](../../README.md) | **⏱️ Délka**: 90-150 minut včetně praxe integrace | **⭐ Složitost**: Středně pokročilý

---

## Přehled

Tato kapitola pokrývá konfiguraci prostředí, vzory autentizace a nejlepší bezpečnostní postupy pro nasazení Azure Developer CLI.

> Cíl revize příkazů a konfigurace: `azd 1.37.2` (listopad 2026). Během revize nebylo provedeno živé Azure provisioning.

## Výukové Cíle

Po dokončení této kapitoly budete:
- Ovládat hierarchii konfigurace AZD
- Spravovat více prostředí (vývoj, test, produkce)
- Implementovat bezpečnou autentizaci s řízenými identitami
- Konfigurovat nastavení specifická pro prostředí

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Průvodce konfigurací](configuration.md) | Nastavení a správa prostředí | 30 min |
| 2 | [Autentizace a Bezpečnost](authsecurity.md) | Vzory řízené identity a RBAC | 30 min |

---

## 🚀 Rychlý Start

Spusťte z kořene **již inicializované aplikace azd**, nikoli z repozitáře kurzu. Použijte nepoužité názvy prostředí, pokud tyto již existují.

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

`SKU_NAME` je ilustrativní: ovlivní infrastrukturu pouze, pokud ji váš šablona explicitně používá. Běžné hodnoty `azd env set` jsou ukládány lokálně v prostém textu; nejsou bezpečným úložištěm tajemství.

---

## 🔧 Hierarchie Konfigurace

Udržujte tři různé konfigurační plochy oddělené: globální předvolby (`azd config`), strukturu projektu (`azure.yaml`) a hodnoty pro jednotlivá prostředí (`azd env`). Přepínače přepisují pouze nastavení, která skutečně podporují; neexistuje žádné univerzální překrytí libovolných proměnných prostředí na `azure.yaml` nebo Bicep.

---

## 🔐 Nejlepší Bezpečnostní Postupy

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

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 2: Vývoj AI](../chapter-02-ai-development/README.md) |
| **Další** | [Kapitola 4: Infrastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Související Zdroje

- [Kontroly před nasazením](../chapter-06-pre-deployment/README.md)
- [Řešení problémů](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->