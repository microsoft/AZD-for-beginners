# 3. fejezet: Konfiguráció és hitelesítés

**📚 Tanfolyam**: [AZD Kezdőknek](../../README.md) | **⏱️ Időtartam**: 45-60 perc | **⭐ Bonyolultság**: Középhaladó

---

## Áttekintés

Ez a fejezet a környezet konfigurációját, a hitelesítési mintákat, valamint az Azure Developer CLI telepítések biztonsági legjobb gyakorlatait tárgyalja.

> Ellenőrizve az `azd 1.27.1` verzióval 2026 júliusában.

## Tanulási célok

A fejezet elvégzése után képes leszel:
- Az AZD konfigurációs hierarchiájának elsajátítása
- Több környezet (fejlesztői, teszt, éles) kezelése
- Biztonságos hitelesítés megvalósítása kezelt identitásokkal
- Környezet specifikus beállítások konfigurálása

---

## 📚 Tananyagok

| # | Lecke | Leírás | Időtartam |
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

# Környezetek közötti váltás
azd env select prod

# Környezeti változók beállítása
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Konfiguráció megtekintése
azd env get-values
```

---

## 🔧 Konfigurációs hierarchia

Az AZD a következő sorrendben alkalmazza a beállításokat (a későbbi felülírja a korábbit):

1. **Alapértelmezett értékek** (beépítve a sablonokba)
2. **azure.yaml** (projekt konfiguráció)
3. **Környezeti változók** (`azd env set`)
4. **Parancssori kapcsolók** (`--location eastus`)

---

## 🔐 Biztonsági legjobb gyakorlatok

```bash
# Használjon kezelt identitást (ajánlott)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Ellenőrizze az AZD hitelesítési állapotát
azd auth status

# Opcionális: ellenőrizze az Azure CLI környezetét, ha az az parancsokat szeretné futtatni
az account show

# Szükség esetén hitelesítse újra magát
azd auth login

# Opcionális: frissítse az Azure CLI hitelesítést az az parancsokhoz
az login
```

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [2. fejezet: Mesterséges intelligencia fejlesztés](../chapter-02-ai-development/README.md) |
| **Következő** | [4. fejezet: Infrastruktúra](../chapter-04-infrastructure/README.md) |

---

## 📖 Kapcsolódó anyagok

- [Telepítés előtti ellenőrzések](../chapter-06-pre-deployment/README.md)
- [Hibaelhárítás](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->