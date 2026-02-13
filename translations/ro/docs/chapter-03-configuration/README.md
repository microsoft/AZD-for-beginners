# Capitolul 3: Configurare și Autentificare

**📚 Course**: [AZD pentru Începători](../../README.md) | **⏱️ Durată**: 45-60 minutes | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol acoperă configurarea mediului, tiparele de autentificare și cele mai bune practici de securitate pentru implementările Azure Developer CLI.

## Obiective de învățare

Parcurgând acest capitol, veți:
- Stăpâniți ierarhia de configurare AZD
- Gestionați medii multiple (dev, staging, prod)
- Implementați autentificare sigură cu identități gestionate
- Configurați setări specifice mediului

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Ghid de configurare](configuration.md) | Configurarea și gestionarea mediului | 30 min |
| 2 | [Autentificare & Securitate](authsecurity.md) | Tipare pentru identități gestionate și RBAC | 30 min |

---

## 🚀 Pornire rapidă

```bash
# Creați mai multe medii
azd env new dev
azd env new staging
azd env new prod

# Comutați între medii
azd env select prod

# Setați variabilele de mediu
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Vizualizați configurația
azd env get-values
```

---

## 🔧 Ierarhia de configurare

AZD aplică setările în această ordine (elementele ulterioare suprascriu pe cele anterioare):

1. **Valorile implicite** (încorporate în șabloane)
2. **azure.yaml** (configurarea proiectului)
3. **Variabile de mediu** (`azd env set`)
4. **Flag-uri din linia de comandă** (`--location eastus`)

---

## 🔐 Cele mai bune practici de securitate

```bash
# Utilizați identitatea gestionată (recomandat)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Verificați starea autentificării
azd auth whoami
az account show

# Reautentificați-vă dacă este necesar
azd auth login
az login
```

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 2: Dezvoltare AI](../chapter-02-ai-development/README.md) |
| **Următor** | [Capitolul 4: Infrastructură](../chapter-04-infrastructure/README.md) |

---

## 📖 Resurse conexe

- [Verificări înainte de implementare](../chapter-06-pre-deployment/README.md)
- [Depanare](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Declinare de responsabilitate:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări eronate care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->