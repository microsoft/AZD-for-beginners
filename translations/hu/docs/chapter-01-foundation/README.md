# 1. fejezet: Alapok és Gyors kezdés

**📚 Tanfolyam**: [AZD For Beginners](../../README.md) | **⏱️ Időtartam**: 30–45 perc | **⭐ Nehézségi szint**: Kezdő

---

## Áttekintés

Ez a fejezet bemutatja az Azure Developer CLI (azd) alapjait. Megismered az alapfogalmakat, telepíted az eszközöket, és telepíted az első alkalmazásodat az Azure-ra.

## Tanulási célok

A fejezet elvégzése után képes leszel:
- Megérteni, mi az Azure Developer CLI és miben különbözik az Azure CLI-től
- Telepíteni és konfigurálni az AZD-t a platformodon
- Telepíteni az első alkalmazásodat az Azure-ra az `azd up` paranccsal
- Eltávolítani az erőforrásokat az `azd down` paranccsal

---

## 📚 Leckék

| # | Lecke | Leírás | Időtartam |
|---|--------|-------------|------|
| 1 | [AZD alapok](azd-basics.md) | Alapfogalmak, terminológia és a projekt felépítése | 15 perc |
| 2 | [Telepítés és beállítás](installation.md) | Platform-specifikus telepítési útmutatók | 10 perc |
| 3 | [Az első projekted](first-project.md) | Gyakorlat: Webalkalmazás telepítése az Azure-ra | 20 perc |

---

## 🚀 Gyors kezdés

```bash
# Ellenőrizze a telepítést
azd version

# Jelentkezzen be az Azure-ba
azd auth login

# Telepítse az első alkalmazását
azd init --template todo-nodejs-mongo
azd up

# Tisztítsa meg a környezetet, ha végzett
azd down --force --purge
```

---

## ✅ Sikerkritériumok

A fejezet elvégzése után képes leszel:

```bash
azd version              # Megjeleníti a telepített verziót
azd init --template todo-nodejs-mongo  # Inicializálja a projektet
azd up                   # Telepíti az Azure-ra
azd show                 # Megjeleníti a futó alkalmazás URL-jét
azd down --force --purge # Felszabadítja az erőforrásokat
```

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Következő** | [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/README.md) |
| **Ugrás** | [3. fejezet: Konfiguráció](../chapter-03-configuration/README.md) |

---

## 📖 Kapcsolódó források

- [Parancs gyorsreferencia](../../resources/cheat-sheet.md)
- [GYIK](../../resources/faq.md)
- [Fogalomtár](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Felelősségkizárás:
A dokumentumot AI-alapú fordítószolgáltatással, a Co-op Translatorral (https://github.com/Azure/co-op-translator) fordítottuk. Bár igyekszünk pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén szakmai emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->