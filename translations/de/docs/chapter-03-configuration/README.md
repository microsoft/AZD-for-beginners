# Kapitel 3: Konfiguration & Authentifizierung

**📚 Kurs**: [AZD für Anfänger](../../README.md) | **⏱️ Dauer**: 45-60 Minuten | **⭐ Komplexität**: Mittelstufe

---

## Übersicht

Dieses Kapitel behandelt die Umgebungskonfiguration, Authentifizierungsmodelle und bewährte Sicherheitspraktiken für Azure Developer CLI-Einsätze.

> Validiert mit `azd 1.27.1` im Juli 2026.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- Die AZD-Konfigurations-Hierarchie beherrschen
- Mehrere Umgebungen (dev, staging, prod) verwalten
- Sichere Authentifizierung mit verwalteten Identitäten implementieren
- Umgebungsspezifische Einstellungen konfigurieren

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Konfigurationsanleitung](configuration.md) | Einrichtung und Verwaltung der Umgebung | 30 Min |
| 2 | [Authentifizierung & Sicherheit](authsecurity.md) | Muster für verwaltete Identität und RBAC | 30 Min |

---

## 🚀 Schnellstart

```bash
# Mehrere Umgebungen erstellen
azd env new dev
azd env new staging
azd env new prod

# Umgebungen wechseln
azd env select prod

# Umgebungsvariablen setzen
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Konfiguration anzeigen
azd env get-values
```

---

## 🔧 Konfigurations-Hierarchie

AZD wendet Einstellungen in folgender Reihenfolge an (jüngere überschreiben ältere):

1. **Standardwerte** (in Vorlagen eingebaut)
2. **azure.yaml** (Projektkonfiguration)
3. **Umgebungsvariablen** (`azd env set`)
4. **Kommandozeilenparameter** (`--location eastus`)

---

## 🔐 Sicherheits-Best-Practices

```bash
# Verwenden Sie verwaltete Identität (empfohlen)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Überprüfen Sie den AZD-Authentifizierungsstatus
azd auth status

# Optional: Überprüfen Sie den Azure CLI-Kontext, wenn Sie planen, az-Befehle auszuführen
az account show

# Bei Bedarf erneut authentifizieren
azd auth login

# Optional: Azure CLI-Authentifizierung für az-Befehle aktualisieren
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

- [Vorbereitende Prüfungen](../chapter-06-pre-deployment/README.md)
- [Fehlerbehebung](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->