# Fejezet 3: Konfiguráció és hitelesítés

**📚 Tanfolyam**: [AZD For Beginners](../../README.md) | **⏱️ Időtartam**: 45-60 perc | **⭐ Nehézségi szint**: Középhaladó

---

## Áttekintés

Ez a fejezet a környezet konfigurációját, hitelesítési mintákat és biztonsági bevált gyakorlatokat tárgyalja az Azure Developer CLI telepítésekhez.

## Tanulási célok

A fejezet elvégzése után képes leszel:
- Megismered az AZD konfigurációs hierarchiáját
- Több környezet (dev, staging, prod) kezelése
- Biztonságos hitelesítés megvalósítása kezelt identitásokkal
- Környezetspecifikus beállítások konfigurálása

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Konfigurációs útmutató](configuration.md) | Környezet beállítása és kezelése | 30 perc |
| 2 | [Hitelesítés és biztonság](authsecurity.md) | Kezelt identitás és RBAC minták | 30 perc |

---

## 🚀 Gyors kezdés

```bash
# Több környezet létrehozása
azd env new dev
azd env new staging
azd env new prod

# Környezetek váltása
azd env select prod

# Környezeti változók beállítása
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Konfiguráció megtekintése
azd env get-values
```

---

## 🔧 Konfigurációs hierarchia

AZD a beállításokat ebben a sorrendben alkalmazza (a későbbi felülírja a korábbit):

1. **Alapértelmezett értékek** (a sablonokba beépítve)
2. **azure.yaml** (projekt konfiguráció)
3. **Környezeti változók** (`azd env set`)
4. **Parancssori kapcsolók** (`--location eastus`)

---

## 🔐 Biztonsági bevált gyakorlatok

```bash
# Használjon kezelt identitást (ajánlott)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Ellenőrizze a hitelesítési állapotot
azd auth whoami
az account show

# Szükség esetén újra hitelesítse magát
azd auth login
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
Felelősségkizárás:
Ez a dokumentum az AI fordítószolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár igyekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti, eredeti nyelvű dokumentum tekintendő a hiteles forrásnak. Kritikus jelentőségű információk esetén ajánlott professzionális, emberi fordítást igénybe venni. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->