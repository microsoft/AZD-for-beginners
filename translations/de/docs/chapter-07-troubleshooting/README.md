# Kapitel 7: Fehlerbehebung & Debugging

**📚 Kurs**: [AZD für Einsteiger](../../README.md) | **⏱️ Dauer**: 1–1,5 Stunden | **⭐ Komplexität**: Mittel

---

## Übersicht

Dieses Kapitel hilft Ihnen, häufige Probleme bei der Arbeit mit Azure Developer CLI zu diagnostizieren und zu beheben. Von Bereitstellungsfehlern bis hin zu AI-spezifischen Problemen.

> Validiert gegen `azd 1.25.6` im Juni 2026.

## Lernziele

Nach Abschluss dieses Kapitels können Sie:
- Häufige AZD-Bereitstellungsfehler diagnostizieren
- Authentifizierungs- und Berechtigungsprobleme debuggen
- Verbindungsprobleme mit AI-Diensten beheben
- Azure-Portal und CLI für die Fehlerbehebung verwenden

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Common Issues](common-issues.md) | Häufig auftretende Probleme | 30 Min |
| 2 | [Debugging Guide](debugging.md) | Schritt-für-Schritt-Debugging-Strategien | 45 Min |
| 3 | [AI Troubleshooting](ai-troubleshooting.md) | AI-spezifische Probleme | 30 Min |

---

## 🚨 Schnelle Lösungen

### Authentifizierungsprobleme
```bash
# Erforderlich für AZD-Workflows
azd auth login

# Optional, wenn Sie auch Azure-CLI-Befehle direkt verwenden
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
| `ResourceNotFound` | Ressource fehlt | Ressourcennamen überprüfen |
| `QuotaExceeded` | Beschränkungen des Abonnements | Erhöhung des Kontingents anfordern |
| `InvalidTemplate` | Bicep-Syntaxfehler | `az bicep build` |
| `Conflict` | Ressource existiert | Neuen Namen verwenden oder löschen |
| `Forbidden` | Unzureichende Berechtigungen | RBAC-Rollen überprüfen |

---

## 🔄 Zurücksetzen und Wiederherstellung

```bash
# Soft-Reset (Ressourcen beibehalten, Code neu bereitstellen)
azd deploy --force

# Hard-Reset (alles löschen, von vorne beginnen)
azd down --force --purge
azd up
```

---

## 🔗 Navigation

| Richtung | Kapitel |
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
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->