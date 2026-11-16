# Kapitel 7: Fehlerbehebung & Debugging

**📚 Kurs**: [AZD für Anfänger](../../README.md) | **⏱️ Dauer**: 1-1,5 Stunden | **⭐ Komplexität**: Mittelstufe

---

## Übersicht

Dieses Kapitel hilft Ihnen, häufige Probleme bei der Arbeit mit der Azure Developer CLI zu diagnostizieren und zu beheben. Von Bereitstellungsfehlern bis hin zu AI-spezifischen Problemen.

> Befehlsanleitung wurde anhand des veröffentlichten `azd 1.37.2` Referenzdokuments überprüft. Cloud-Bereitstellungen wurden nicht ausgeführt. Ersetzen Sie Beispielressourcennamen und IDs, bevor Sie Befehle verwenden.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- Häufige AZD-Bereitstellungsfehler diagnostizieren können
- Authentifizierungs- und Berechtigungsprobleme debuggen können
- AI-Dienst-Konnektivitätsprobleme lösen können
- Azure Portal und CLI zur Fehlerbehebung verwenden können

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Häufige Probleme](common-issues.md) | Häufig auftretende Probleme | 30 Min |
| 2 | [Debugging-Anleitung](debugging.md) | Schritt-für-Schritt Debugging-Strategien | 45 Min |
| 3 | [AI-Fehlerbehebung](ai-troubleshooting.md) | AI-spezifische Probleme | 30 Min |

---

## 🚨 Schnelle Lösungen

### Authentifizierungsprobleme
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Bereitstellungsfehler
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Ressourcen-Konflikte
Überprüfen Sie zuerst die bestehenden Ressourcen- und Bereitstellungsfehler. Löschen Sie nicht eine gemeinsam genutzte oder Produktionsumgebung, um einen Namenskonflikt zu beheben. Für eine **neue, entbehrliche Umgebung** verwenden Sie einen eindeutigen Namen:

```bash
azd env new different-name
azd up
```

### Kontingent überschritten
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Das Ändern von `AZURE_LOCATION` verschiebt keine bestehenden Ressourcen und kann bei einer erneuten Bereitstellung zu Standortkonflikten führen.

---

## 📋 Fehlercode-Referenz

| Fehler | Ursache | Lösung |
|-------|-------|----------|
| `AuthenticationError` | Nicht angemeldet | `azd auth login` |
| `ResourceNotFound` | Fehlende Ressource | Überprüfen Sie Ressourcennamen |
| `QuotaExceeded` | Abonnementlimits | Beantragen Sie eine Kontingenterhöhung |
| `InvalidTemplate` | Bicep-Syntaxfehler | `az bicep build` |
| `Conflict` | Ressource existiert bereits | Verwenden Sie einen neuen Namen oder löschen Sie die Ressource |
| `Forbidden` | Unzureichende Berechtigungen | Überprüfen Sie RBAC-Rollen |

---

## 🔄 Rücksetzen und Wiederherstellung

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Das harte Zurücksetzen löscht Daten und kann Endpunkte ändern. Sichern Sie zuerst die Daten und prüfen Sie die interaktiven Löschabfragen. `--force --purge` ist nur für entbehrliche Umgebungen geeignet, wenn eine irreversible Löschung beabsichtigt ist.

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Vorheriges** | [Kapitel 6: Vorbereitungen vor der Bereitstellung](../chapter-06-pre-deployment/README.md) |
| **Nächstes** | [Kapitel 8: Produktion](../chapter-08-production/README.md) |

---

## 📖 Verwandte Ressourcen

- [Vorbereitungsprüfungen](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurationsanleitung](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->