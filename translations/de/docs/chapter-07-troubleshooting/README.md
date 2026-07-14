# Kapitel 7: Fehlersuche & Debugging

**📚 Kurs**: [AZD Für Einsteiger](../../README.md) | **⏱️ Dauer**: 1-1,5 Stunden | **⭐ Komplexität**: Mittelstufe

---

## Überblick

Dieses Kapitel hilft Ihnen, häufige Probleme bei der Arbeit mit Azure Developer CLI zu diagnostizieren und zu beheben. Von Bereitstellungsfehlern bis hin zu KI-spezifischen Problemen.

> Validiert mit `azd 1.27.1` im Juli 2026.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- Häufige AZD-Bereitstellungsfehler diagnostizieren
- Authentifizierungs- und Berechtigungsprobleme debuggen
- Verbindungsprobleme von KI-Diensten lösen
- Azure Portal und CLI für die Fehlersuche nutzen

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Häufige Probleme](common-issues.md) | Häufig auftretende Probleme | 30 Min |
| 2 | [Debugging-Anleitung](debugging.md) | Schritt-für-Schritt-Debugging-Strategien | 45 Min |
| 3 | [KI-Fehlersuche](ai-troubleshooting.md) | KI-spezifische Probleme | 30 Min |

---

## 🚨 Schnelle Lösungen

### Authentifizierungsprobleme
```bash
# Erforderlich für AZD-Workflows
azd auth login

# Optional, wenn Sie auch direkt Azure CLI-Befehle verwenden
az login

azd auth status
```

### Bereitstellungsfehler
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Ressourcen-Konflikte
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Kontingent überschritten
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Fehlercode-Referenz

| Fehler | Ursache | Lösung |
|-------|-------|----------|
| `AuthenticationError` | Nicht eingeloggt | `azd auth login` |
| `ResourceNotFound` | Ressource fehlt | Ressourcennamen prüfen |
| `QuotaExceeded` | Abonnement-Limits | Kontingenterhöhung anfragen |
| `InvalidTemplate` | Bicep-Syntaxfehler | `az bicep build` |
| `Conflict` | Ressource existiert bereits | Neuen Namen verwenden oder löschen |
| `Forbidden` | Unzureichende Berechtigungen | RBAC-Rollen prüfen |

---

## 🔄 Zurücksetzen und Wiederherstellung

```bash
# Weicher Neustart (Ressourcen behalten, Code neu bereitstellen)
azd deploy --force

# Harter Neustart (alles löschen, neu starten)
azd down --force --purge
azd up
```

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Vorheriges** | [Kapitel 6: Vorbereitende Maßnahmen](../chapter-06-pre-deployment/README.md) |
| **Nächstes** | [Kapitel 8: Produktion](../chapter-08-production/README.md) |

---

## 📖 Verwandte Ressourcen

- [Pre-Deployment Checks](../chapter-06-pre-deployment/preflight-checks.md)
- [Configuration Guide](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->