# Kapitel 3: Konfiguration & Authentifizierung

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 45-60 Minuten | **⭐ Complexity**: Mittel

---

## Überblick

Dieses Kapitel behandelt die Umgebungs-Konfiguration, Authentifizierungsmuster und Sicherheits-Best-Practices für Azure Developer CLI-Bereitstellungen.

> Validiert gegen `azd 1.23.12` im März 2026.

## Lernziele

Durch das Abschließen dieses Kapitels werden Sie:
- Die AZD-Konfigurationshierarchie meistern
- Mehrere Umgebungen (dev, staging, prod) verwalten
- Sichere Authentifizierung mit Managed Identities implementieren
- Umgebungsspezifische Einstellungen konfigurieren

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Konfigurationsanleitung](configuration.md) | Einrichtung und Verwaltung von Umgebungen | 30 Min. |
| 2 | [Authentifizierung & Sicherheit](authsecurity.md) | Managed Identity- und RBAC-Muster | 30 Min. |

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

AZD wendet Einstellungen in dieser Reihenfolge an (Spätere überschreiben frühere):

1. **Standardwerte** (in Vorlagen eingebaut)
2. **azure.yaml** (Projektkonfiguration)
3. **Umgebungsvariablen** (`azd env set`)
4. **Kommandozeilen-Flags** (`--location eastus`)

---

## 🔐 Sicherheits-Best-Practices

```bash
# Verwenden Sie eine verwaltete Identität (empfohlen)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Überprüfen Sie den AZD-Authentifizierungsstatus
azd auth status

# Optional: Überprüfen Sie den Azure CLI-Kontext, wenn Sie vorhaben, az-Befehle auszuführen
az account show

# Bei Bedarf erneut authentifizieren
azd auth login

# Optional: Aktualisieren Sie die Azure CLI-Authentifizierung für az-Befehle
az login
```

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Vorherige** | [Kapitel 2: KI-Entwicklung](../chapter-02-ai-development/README.md) |
| **Nächste** | [Kapitel 4: Infrastruktur](../chapter-04-infrastructure/README.md) |

---

## 📖 Verwandte Ressourcen

- [Prüfungen vor der Bereitstellung](../chapter-06-pre-deployment/README.md)
- [Fehlerbehebung](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir auf Genauigkeit achten, seien Sie sich bitte bewusst, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ausgangssprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->