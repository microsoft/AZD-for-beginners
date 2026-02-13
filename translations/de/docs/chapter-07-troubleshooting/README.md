# Kapitel 7: Fehlerbehebung & Debugging

**📚 Kurs**: [AZD für Einsteiger](../../README.md) | **⏱️ Dauer**: 1-1.5 Stunden | **⭐ Komplexität**: Mittel

---

## Überblick

Dieses Kapitel hilft Ihnen, häufige Probleme bei der Arbeit mit dem Azure Developer CLI zu diagnostizieren und zu beheben. Von Bereitstellungsfehlern bis hin zu KI-spezifischen Problemen.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- Häufige AZD-Bereitstellungsfehler diagnostizieren
- Authentifizierungs- und Berechtigungsprobleme debuggen
- Verbindungsprobleme von KI-Diensten beheben
- Azure-Portal und CLI für die Fehlerbehebung verwenden

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Häufige Probleme](common-issues.md) | Häufig auftretende Probleme | 30 Min |
| 2 | [Debugging-Anleitung](debugging.md) | Schritt-für-Schritt-Debugging-Strategien | 45 Min |
| 3 | [KI-Fehlerbehebung](ai-troubleshooting.md) | KI-spezifische Probleme | 30 Min |

---

## 🚨 Schnelllösungen

### Authentifizierungsprobleme
```bash
azd auth login
az login
azd auth whoami
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
| `QuotaExceeded` | Abonnementbeschränkungen | Kontingenterhöhung anfordern |
| `InvalidTemplate` | Syntaxfehler in Bicep | `az bicep build` |
| `Conflict` | Ressource existiert | Neuen Namen verwenden oder löschen |
| `Forbidden` | Unzureichende Berechtigungen | RBAC-Rollen überprüfen |

---

## 🔄 Zurücksetzen und Wiederherstellung

```bash
# Soft-Reset (Ressourcen behalten, Code neu bereitstellen)
azd deploy --force

# Hard-Reset (alles löschen, neu beginnen)
azd down --force --purge
azd up
```

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Vorherige** | [Kapitel 6: Vor der Bereitstellung](../chapter-06-pre-deployment/README.md) |
| **Nächste** | [Kapitel 8: Produktion](../chapter-08-production/README.md) |

---

## 📖 Verwandte Ressourcen

- [Vorbereitungsprüfungen](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurationsanleitung](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ausgangssprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->