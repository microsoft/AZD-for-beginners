# Kapitel 3: Konfiguration & Authentifizierung

**📚 Kurs**: [AZD für Einsteiger](../../README.md) | **⏱️ Dauer**: 90-150 Minuten inklusive Integrationspraxis | **⭐ Komplexität**: Mittelstufe

---

## Übersicht

Dieses Kapitel behandelt Umgebungs-Konfiguration, Authentifizierungsmuster und Sicherheits-Best-Practices für Azure Developer CLI-Deployments.

> Ziel der Befehls- und Konfigurationsüberprüfung: `azd 1.37.2` (November 2026). Live Azure-Bereitstellung wurde während der Überprüfung nicht ausgeführt.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- Die AZD-Konfigurationshierarchie beherrschen
- Mehrere Umgebungen verwalten (Entwicklung, Staging, Produktion)
- Sichere Authentifizierung mit verwalteten Identitäten implementieren
- Umgebungs-spezifische Einstellungen konfigurieren

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Konfigurationsanleitung](configuration.md) | Umgebungseinrichtung und -verwaltung | 30 Min |
| 2 | [Authentifizierung & Sicherheit](authsecurity.md) | Verwaltete Identität und RBAC-Muster | 30 Min |

---

## 🚀 Schnellstart

Führen Sie den Befehl vom Stammverzeichnis einer **bereits initialisierten azd-Anwendung** aus, nicht vom Kurs-Repository. Verwenden Sie ungenutzte Umgebungsnamen, falls diese bereits existieren.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` ist illustrativ: Es beeinflusst die Infrastruktur nur, wenn Ihre Vorlage es explizit verwendet. Gewöhnliche `azd env set`-Werte werden lokal im Klartext gespeichert; sie sind kein sicherer Geheimnisspeicher.

---

## 🔧 Konfigurationshierarchie

Halten Sie drei verschiedene Konfigurationsbereiche getrennt: globale Präferenzen (`azd config`), Projektstruktur (`azure.yaml`) und umgebungsspezifische Werte (`azd env`). Flags überschreiben nur die Einstellungen, die sie tatsächlich unterstützen; es gibt keine universelle Überlagerung beliebiger Umgebungsvariablen auf `azure.yaml` oder Bicep.

---

## 🔐 Sicherheits-Best-Practices

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Vorheriges** | [Kapitel 2: KI-Entwicklung](../chapter-02-ai-development/README.md) |
| **Nächstes** | [Kapitel 4: Infrastruktur](../chapter-04-infrastructure/README.md) |

---

## 📖 Verwandte Ressourcen

- [Pre-Deployment-Prüfungen](../chapter-06-pre-deployment/README.md)
- [Fehlerbehebung](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->