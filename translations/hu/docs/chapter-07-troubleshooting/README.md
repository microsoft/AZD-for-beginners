# 7. fejezet: Hibakeresés és hibaelhárítás

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 1-1,5 óra | **⭐ Bonyolultság**: Középhaladó

---

## Áttekintés

Ez a fejezet segít diagnosztizálni és megoldani a gyakori problémákat az Azure Developer CLI használata közben. A telepítési hibáktól az AI-specifikus problémákig.

> A parancsok útmutatása a kiadott `azd 1.37.2` referencia alapján készült. Felhőbe történő telepítések nem kerültek végrehajtásra. A parancsok használata előtt cseréld ki a példa erőforrásneveket és azonosítókat.

## Tanulási célok

Ennek a fejezetnek a befejezése után képes leszel:
- Diagnosztizálni a gyakori AZD telepítési hibákat
- Hibakeresni az autentikációs és engedélyezési problémákat
- Megoldani az AI szolgáltatás kapcsolódási problémáit
- Az Azure Portal és CLI használata hibakereséshez

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Gyakori problémák](common-issues.md) | Gyakran előforduló gondok | 30 perc |
| 2 | [Hibakeresési útmutató](debugging.md) | Lépésenkénti hibakeresési stratégiák | 45 perc |
| 3 | [AI hibaelhárítás](ai-troubleshooting.md) | AI-specifikus problémák | 30 perc |

---

## 🚨 Gyors javítások

### Autentikációs problémák
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Telepítési hibák
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Erőforrás-ütközések
Először vizsgáld meg a meglévő erőforrást és a telepítési hibákat. Ne törölj megosztott vagy éles környezetet egy névütközés megoldása érdekében. Egy **új, eldobható környezethez** használj egyedi nevet:

```bash
azd env new different-name
azd up
```

### Kvóta túllépve
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Az `AZURE_LOCATION` módosítása nem mozgatja a meglévő erőforrásokat, és újratelepítéskor helyszínütközéseket okozhat.

---

## 📋 Hibakód referencia

| Hiba | Oka | Megoldás |
|-------|-------|----------|
| `AuthenticationError` | Nincs bejelentkezve | `azd auth login` |
| `ResourceNotFound` | Hiányzó erőforrás | Ellenőrizd az erőforrásneveket |
| `QuotaExceeded` | Előfizetési korlátok | Kérj kvótaemelést |
| `InvalidTemplate` | Bicep szintaxis hiba | `az bicep build` |
| `Conflict` | Erőforrás már létezik | Használj új nevet vagy töröld |
| `Forbidden` | Nem elegendő jogosultság | Ellenőrizd az RBAC szerepköröket |

---

## 🔄 Visszaállítás és helyreállítás

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

A kemény visszaállítás törli az adatokat és megváltoztathatja a végpontokat. Először készíts biztonsági mentést és ellenőrizd az interaktív törlési megerősítéseket. Az `--force --purge` csak eldobható környezeteknél alkalmas, amikor visszafordíthatatlan törlés a cél.

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [6. fejezet: Előtelepítés](../chapter-06-pre-deployment/README.md) |
| **Következő** | [8. fejezet: Éles környezet](../chapter-08-production/README.md) |

---

## 📖 Kapcsolódó források

- [Előtelepítési ellenőrzések](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurációs útmutató](../chapter-03-configuration/configuration.md)
- [AZD GitHub problémák](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->