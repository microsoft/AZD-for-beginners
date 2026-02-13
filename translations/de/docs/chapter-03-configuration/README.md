# Kapitel 3: Konfiguration & Authentifizierung

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Dauer**: 45-60 Minuten | **⭐ Komplexität**: Mittel

---

## Übersicht

Dieses Kapitel behandelt die Konfiguration von Umgebungen, Authentifizierungsmuster und bewährte Sicherheitsverfahren für Bereitstellungen mit dem Azure Developer CLI.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- Die AZD-Konfigurationshierarchie beherrschen
- Mehrere Umgebungen verwalten (dev, staging, prod)
- Sichere Authentifizierung mit verwalteten Identitäten implementieren
- Umgebungsspezifische Einstellungen konfigurieren

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Konfigurationsanleitung](configuration.md) | Einrichtung und Verwaltung von Umgebungen | 30 min |
| 2 | [Authentifizierung & Sicherheit](authsecurity.md) | Muster für verwaltete Identitäten und RBAC | 30 min |

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

## 🔧 Konfigurationshierarchie

AZD wendet Einstellungen in dieser Reihenfolge an (Späteres überschreibt Früheres):

1. **Standardwerte** (in die Vorlagen eingebaut)
2. **azure.yaml** (Projektkonfiguration)
3. **Umgebungsvariablen** (`azd env set`)
4. **Kommandozeilen-Flags** (`--location eastus`)

---

## 🔐 Sicherheits-Best-Practices

```bash
# Verwenden Sie eine verwaltete Identität (empfohlen)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Überprüfen Sie den Authentifizierungsstatus
azd auth whoami
az account show

# Authentifizieren Sie sich bei Bedarf erneut
azd auth login
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

- [Prüfungen vor der Bereitstellung](../chapter-06-pre-deployment/README.md)
- [Fehlerbehebung](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ausgangssprache ist als maßgebliche Quelle anzusehen. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->