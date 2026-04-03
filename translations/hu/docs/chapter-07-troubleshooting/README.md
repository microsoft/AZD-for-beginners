# 7. fejezet: Hibaelhárítás és hibakeresés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 1-1,5 óra | **⭐ Nehézségi szint**: Középhaladó

---

## Áttekintés

Ez a fejezet segít diagnosztizálni és megoldani az Azure Developer CLI használata során gyakran előforduló problémákat. A telepítési hibáktól az AI-specifikus problémákig.

> Validálva az `azd 1.23.12` verzióval 2026 márciusában.

## Tanulási célok

A fejezet elvégzésével Ön képes lesz:
- Gyakori AZD telepítési hibák diagnosztizálására
- Hitelesítési és jogosultsági problémák hibakeresésére
- AI szolgáltatás kapcsolódási problémáinak megoldására
- Azure Portal és CLI használatára a hibaelhárításhoz

---

## 📚 Tananyagok

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Gyakori problémák](common-issues.md) | Gyakran előforduló hibák | 30 perc |
| 2 | [Hibakeresési útmutató](debugging.md) | Lépésről lépésre hibakeresési stratégiák | 45 perc |
| 3 | [AI hibakeresés](ai-troubleshooting.md) | AI-specifikus problémák | 30 perc |

---

## 🚨 Gyors megoldások

### Hitelesítési hibák
```bash
# Szükséges AZD munkafolyamatokhoz
azd auth login

# Opcionális, ha közvetlenül Azure CLI parancsokat is használ
az login

azd auth status
```

### Szolgáltatás létrehozási hibák
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Erőforrások közötti ütközések
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Kvóta túllépés
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Hibakódok áttekintése

| Hiba | Ok | Megoldás |
|-------|-------|----------|
| `AuthenticationError` | Nem bejelentkezett | `azd auth login` |
| `ResourceNotFound` | Hiányzó erőforrás | Ellenőrizze az erőforrás neveit |
| `QuotaExceeded` | Előfizetési korlátok | Kvóta növelését kérje |
| `InvalidTemplate` | Bicep szintaxis hiba | `az bicep build` |
| `Conflict` | Az erőforrás létezik | Használjon új nevet vagy törölje |
| `Forbidden` | Nincs elegendő jogosultság | Ellenőrizze az RBAC szerepköröket |

---

## 🔄 Visszaállítás és helyreállítás

```bash
# Lágy visszaállítás (erőforrások megtartása, kód újratelepítése)
azd deploy --force

# Kemény visszaállítás (minden törlése, újrakezdés)
azd down --force --purge
azd up
```

---

## 🔗 Navigáció

| Irany | Fejezet |
|-----------|---------|
| **Előző** | [6. fejezet: Telepítés előtti lépések](../chapter-06-pre-deployment/README.md) |
| **Következő** | [8. fejezet: Éles környezet](../chapter-08-production/README.md) |

---

## 📖 Kapcsolódó anyagok

- [Telepítés előtti ellenőrzések](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurációs útmutató](../chapter-03-configuration/configuration.md)
- [AZD GitHub problémák](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősségkizárás**:  
Ez a dokumentum az AI fordítószolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Kritikus információk esetén szakmai emberi fordítást javaslunk. Nem vállalunk felelősséget semmilyen félreértésért vagy félreértelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->