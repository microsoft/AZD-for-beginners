# Poglavlje 4: Infrastruktura kao kod & Implementacija

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 1-1,5 sati | **⭐ Složenost**: Srednja

---

## Pregled

Ovo poglavlje pokriva obrasce Infrastrukture kao koda (IaC) s Bicep predlošcima, provisioniranje resursa i strategije implementacije koristeći Azure Developer CLI.

> Validirano s `azd 1.27.1` u srpnju 2026.

## Ciljevi učenja

Završetkom ovog poglavlja ćete:
- Razumjeti strukturu i sintaksu Bicep predloška
- Provisionirati Azure resurse s `azd provision`
- Implementirati aplikacije s `azd deploy`
- Primijeniti strategije implementacije plavo-zelena i postupna implementacija

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Provisioniranje resursa](provisioning.md) | Upravljanje Azure resursima s AZD | 45 min |
| 2 | [Vodič za implementaciju](deployment-guide.md) | Strategije implementacije aplikacija | 45 min |
| 3 | [Izrada vlastitog predloška](custom-templates.md) | Izgradnja i objava ponovno iskoristivih azd predložaka | 30 min |

---

## 🚀 Brzi početak

```bash
# Inicijaliziraj iz predloška
azd init --template azure-functions-python-v2-http

# Pregledaj što će biti kreirano
azd provision --preview

# Postavi infrastrukturu samo
azd provision

# Implementiraj samo kod
azd deploy

# Ili oboje zajedno
azd up
```

---

## 📁 Struktura AZD projekta

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Osnovne naredbe

| Naredba | Opis |
|---------|-------------|
| `azd init` | Inicijalizacija projekta |
| `azd provision` | Kreiranje Azure resursa |
| `azd deploy` | Implementacija koda aplikacije |
| `azd up` | provision + implementacija |
| `azd down` | Brisanje svih resursa |

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 3: Konfiguracija](../chapter-03-configuration/README.md) |
| **Sljedeće** | [Poglavlje 5: Višestruka agentska rješenja](../chapter-05-multi-agent/README.md) |

---

## 📖 Povezani resursi

- [Provjere prije implementacije](../chapter-06-pre-deployment/README.md)
- [Primjeri Container aplikacija](../../examples/container-app/README.md)
- [Primjer aplikacije s bazom podataka](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->