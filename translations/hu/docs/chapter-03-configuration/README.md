# 3. Fejezet: Konfiguráció és hitelesítés

**📚 Tanfolyam**: [AZD Kezdőknek](../../README.md) | **⏱️ Időtartam**: 45-60 perc | **⭐ Nehézségi szint**: Középhaladó

---

## Áttekintés

Ez a fejezet a környezet konfigurációját, a hitelesítési mintákat és az Azure Developer CLI telepítések biztonsági ajánlásait tárgyalja.

> Ellenőrizve `azd 1.25.6` verzióval 2026 júniusában.

## Tanulási célok

A fejezet elvégzése után Ön képes lesz:
- Az AZD konfigurációs hierarchiájának elsajátítására
- Több környezet (fejlesztő, teszt, éles) kezelésére
- Biztonságos hitelesítés megvalósítására kezelt identitásokkal
- Környezet-specifikus beállítások konfigurálására

---

## 📚 Tananyagok

| # | Tananyag | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Konfigurációs útmutató](configuration.md) | Környezet beállítása és kezelése | 30 perc |
| 2 | [Hitelesítés és biztonság](authsecurity.md) | Kezelt identitás és RBAC minták | 30 perc |

---

## 🚀 Gyors indulás

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

Az AZD a beállításokat az alábbi sorrendben alkalmazza (a későbbi felülírja az előzőt):

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

# Opcionális: az Azure CLI kontextus ellenőrzése, ha az az parancsokat tervezi futtatni
az account show

# Szükség esetén újra hitelesítse magát
azd auth login

# Opcionális: frissítse az Azure CLI hitelesítést az az parancsokhoz
az login
```

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [2. Fejezet: AI fejlesztés](../chapter-02-ai-development/README.md) |
| **Következő** | [4. Fejezet: Infrastruktúra](../chapter-04-infrastructure/README.md) |

---

## 📖 Kapcsolódó források

- [Telepítés előtti ellenőrzések](../chapter-06-pre-deployment/README.md)
- [Hibaelhárítás](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->