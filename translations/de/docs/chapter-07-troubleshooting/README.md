# Kapitel 7: Fehlerbehebung & Debugging

**📚 Kurs**: [AZD Für Anfänger](../../README.md) | **⏱️ Dauer**: 1–1,5 Stunden | **⭐ Komplexität**: Mittel

---

## Überblick

Dieses Kapitel hilft Ihnen, häufige Probleme bei der Arbeit mit der Azure Developer CLI zu diagnostizieren und zu beheben. Von Bereitstellungsfehlern bis hin zu KI-spezifischen Problemen.

> Validiert gegen `azd 1.23.12` im März 2026.

## Lernziele

Durch das Abschließen dieses Kapitels werden Sie:
- Häufige AZD-Bereitstellungsfehler diagnostizieren
- Authentifizierungs- und Berechtigungsprobleme debuggen
- Konnektivitätsprobleme mit KI-Diensten lösen
- Portal und CLI von Azure für die Fehlersuche verwenden

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Häufige Probleme](common-issues.md) | Häufig auftretende Probleme | 30 Min |
| 2 | [Debugging-Leitfaden](debugging.md) | Schritt-für-Schritt-Fehlersuchstrategien | 45 Min |
| 3 | [KI-Fehlerbehebung](ai-troubleshooting.md) | KI-spezifische Probleme | 30 Min |

---

## 🚨 Schnelllösungen

### Authentifizierungsprobleme
```bash
# Erforderlich für AZD-Workflows
azd auth login

# Optional, wenn Sie auch Azure CLI-Befehle direkt verwenden
az login

azd auth status
```

### Bereitstellungsfehler
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Ressourcenkonflikte
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
| `AuthenticationError` | Nicht angemeldet | `azd auth login` |
| `ResourceNotFound` | Fehlende Ressource | Überprüfen Sie die Ressourcennamen |
| `QuotaExceeded` | Abonnementlimits | Erhöhung des Kontingents anfordern |
| `InvalidTemplate` | Bicep-Syntaxfehler | `az bicep build` |
| `Conflict` | Ressource existiert | Neuen Namen verwenden oder löschen |
| `Forbidden` | Unzureichende Berechtigungen | RBAC-Rollen überprüfen |

---

## 🔄 Zurücksetzen und Wiederherstellung

```bash
# Soft-Reset (Ressourcen behalten, Code neu bereitstellen)
azd deploy --force

# Hard-Reset (alles löschen, von vorn beginnen)
azd down --force --purge
azd up
```

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Kapitel 6: Vorbereitungen vor der Bereitstellung](../chapter-06-pre-deployment/README.md) |
| **Next** | [Kapitel 8: Produktion](../chapter-08-production/README.md) |

---

## 📖 Verwandte Ressourcen

- [Vorbereitungsprüfungen](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurationsanleitung](../chapter-03-configuration/configuration.md)
- [AZD GitHub-Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, sollten Sie beachten, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache ist als maßgebliche Quelle zu betrachten. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->