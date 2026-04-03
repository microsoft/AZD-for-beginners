# 3. fejezet: Konfiguráció és hitelesítés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 45-60 perc | **⭐ Nehézségi szint**: Középhaladó

---

## Áttekintés

Ez a fejezet a környezet konfigurációját, hitelesítési mintákat és biztonsági legjobb gyakorlatokat tárgyalja az Azure Developer CLI telepítésekhez.

> Érvényesítve az `azd 1.23.12` verzióval, 2026 márciusában.

## Tanulási célok

A fejezet elvégzésével Ön:
- Elsajátítja az AZD konfigurációs hierarchiáját
- Kezeli a több környezetet (fejlesztés, tesztelés, éles)
- Megvalósít biztonságos hitelesítést kezelt identitásokkal
- Konfigurálja a környezet-specifikus beállításokat

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Konfiguráció útmutató](configuration.md) | Környezet beállítása és kezelése | 30 perc |
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

1. **Alapértelmezett értékek** (a sablonokban beépítve)
2. **azure.yaml** (projekt konfiguráció)
3. **Környezeti változók** (`azd env set`)
4. **Parancssori kapcsolók** (`--location eastus`)

---

## 🔐 Biztonsági legjobb gyakorlatok

```bash
# Használjon felügyelt identitást (ajánlott)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Ellenőrizze az AZD hitelesítési állapotát
azd auth status

# Opcionális: ellenőrizze az Azure CLI környezetét, ha az az parancsokat kíván futtatni
az account show

# Ha szükséges, jelentkezzen be újra
azd auth login

# Opcionális: frissítse az Azure CLI hitelesítést az az parancsokhoz
az login
```

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [2. fejezet: AI fejlesztés](../chapter-02-ai-development/README.md) |
| **Következő** | [4. fejezet: Infrastruktúra](../chapter-04-infrastructure/README.md) |

---

## 📖 Kapcsolódó anyagok

- [Telepítés előtti ellenőrzések](../chapter-06-pre-deployment/README.md)
- [Hibaelhárítás](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások tartalmazhatnak hibákat vagy pontatlanságokat. Az eredeti dokumentum az anyanyelvén tekintendő hivatalos forrásnak. Kritikus információk esetén szakmai, emberi fordítást javaslunk. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->