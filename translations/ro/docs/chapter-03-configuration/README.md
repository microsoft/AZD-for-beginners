# Capitolul 3: Configurare & Autentificare

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 45-60 minute | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol acoperă configurarea mediului, tiparele de autentificare și cele mai bune practici de securitate pentru implementările Azure Developer CLI.

> Validat cu `azd 1.25.6` în iunie 2026.

## Obiective de învățare

După finalizarea acestui capitol, vei:
- Stăpâni ierarhia de configurare AZD
- Gestiona mai multe medii (dev, staging, prod)
- Implementa autentificare sigură cu identități gestionate
- Configura setări specifice mediului

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Ghid de Configurare](configuration.md) | Configurarea și gestionarea mediului | 30 min |
| 2 | [Autentificare & Securitate](authsecurity.md) | Tipare de identitate gestionată și RBAC | 30 min |

---

## 🚀 Pornire rapidă

```bash
# Creează mai multe medii
azd env new dev
azd env new staging
azd env new prod

# Schimbă mediile
azd env select prod

# Setează variabilele de mediu
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Vizualizează configurația
azd env get-values
```

---

## 🔧 Ierarhia Configurării

AZD aplică setările în această ordine (ulterior suprascrie anterior):

1. **Valori implicite** (încorporate în șabloane)
2. **azure.yaml** (configurarea proiectului)
3. **Variabile de mediu** (`azd env set`)
4. **Flaguri din linia de comandă** (`--location eastus`)

---

## 🔐 Cele mai bune practici de securitate

```bash
# Folosește identitate gestionată (recomandat)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Verifică starea autentificării AZD
azd auth status

# Opțional: verifică contextul Azure CLI dacă intenționezi să rulezi comenzi az
az account show

# Re-autentifică-te dacă este nevoie
azd auth login

# Opțional: reîmprospătează autentificarea Azure CLI pentru comenzile az
az login
```

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 2: Dezvoltare AI](../chapter-02-ai-development/README.md) |
| **Următor** | [Capitolul 4: Infrastructură](../chapter-04-infrastructure/README.md) |

---

## 📖 Resurse relevante

- [Verificări Pre-Implementare](../chapter-06-pre-deployment/README.md)
- [Depanare](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->