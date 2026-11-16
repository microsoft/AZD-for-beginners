# 3. fejezet: Konfiguráció és hitelesítés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 90-150 perc integrációs gyakorlattal | **⭐ Összetettség**: Középhaladó

---

## Áttekintés

Ez a fejezet az Azure Developer CLI telepítések környezeti konfigurációját, hitelesítési mintáit és biztonsági bevált gyakorlatait ismerteti.

> Parancs- és konfigurációellenőrzés célpont: `azd 1.37.2` (2026. november). Éles Azure előkészítés nem történt az ellenőrzés során.

## Tanulási célok

A fejezet elvégzésével:
- Sajátítod az AZD konfigurációs hierarchiát
- Több környezet (fejlesztés, előkészítés, éles) kezelését megtanulod
- Biztonságos hitelesítést valósítasz meg kezelt identitásokkal
- Környezet-specifikus beállításokat konfigurálsz

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Konfigurációs útmutató](configuration.md) | Környezet beállítása és kezelése | 30 perc |
| 2 | [Hitelesítés és biztonság](authsecurity.md) | Kezelt identitás és RBAC minták | 30 perc |

---

## 🚀 Gyors kezdés

Futtasd egy **már inicializált azd alkalmazás gyökeréből**, ne a tanfolyam tárházából. Használj nem használt környezetneveket, ha ezek már léteznek.

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

`SKU_NAME` illusztratív: csak akkor befolyásolja az infrastruktúrát, ha a sablonod kifejezetten felhasználja. A megszokott `azd env set` értékek helyileg, titkosítatlanul vannak tárolva; nem szolgálnak biztonságos titkos tárolóként.

---

## 🔧 Konfigurációs hierarchia

Tartsd külön három különböző konfigurációs felületet: globális preferenciák (`azd config`), projekt struktúra (`azure.yaml`) és környezetenkénti értékek (`azd env`). A jelzők csak az általuk támogatott beállításokat írják felül; nincs univerzális átfedés tetszőleges környezeti változókról `azure.yaml` vagy Bicep fölé.

---

## 🔐 Biztonsági bevált gyakorlatok

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

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [2. fejezet: AI fejlesztés](../chapter-02-ai-development/README.md) |
| **Következő** | [4. fejezet: Infrastruktúra](../chapter-04-infrastructure/README.md) |

---

## 📖 Kapcsolódó források

- [Telepítés előtti ellenőrzések](../chapter-06-pre-deployment/README.md)
- [Hibaelhárítás](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->