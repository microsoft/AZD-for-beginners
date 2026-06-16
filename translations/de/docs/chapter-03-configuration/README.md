# Kapitel 3: Konfiguration & Authentifizierung

**📚 Kurs**: [AZD für Einsteiger](../../README.md) | **⏱️ Dauer**: 45-60 Minuten | **⭐ Komplexität**: Mittel

---

## Übersicht

Dieses Kapitel behandelt Umgebungs­konfiguration, Authentifizierungs­muster und bewährte Sicherheitsverfahren für Deployments mit der Azure Developer CLI.

> Geprüft mit `azd 1.25.6` im Juni 2026.

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
| 1 | [Konfigurationsleitfaden](configuration.md) | Einrichtung und Verwaltung der Umgebung | 30 Min. |
| 2 | [Authentifizierung & Sicherheit](authsecurity.md) | Muster für verwaltete Identitäten und RBAC | 30 Min. |

---

## 🚀 Schnellstart

```bash
# Mehrere Umgebungen erstellen
azd env new dev
azd env new staging
azd env new prod

# Zwischen Umgebungen wechseln
azd env select prod

# Umgebungsvariablen setzen
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Konfiguration anzeigen
azd env get-values
```

---

## 🔧 Konfigurationshierarchie

AZD wendet Einstellungen in folgender Reihenfolge an (spätere überschreiben frühere):

1. **Standardwerte** (in Vorlagen integriert)
2. **azure.yaml** (Projektkonfiguration)
3. **Umgebungsvariablen** (`azd env set`)
4. **Kommandozeilen-Flags** (`--location eastus`)

---

## 🔐 Bewährte Sicherheitsverfahren

```bash
# Verwenden Sie eine verwaltete Identität (empfohlen)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Überprüfen Sie den AZD-Authentifizierungsstatus
azd auth status

# Optional: Überprüfen Sie den Azure-CLI-Kontext, wenn Sie vorhaben, az-Befehle auszuführen
az account show

# Bei Bedarf erneut authentifizieren
azd auth login

# Optional: Aktualisieren Sie die Azure-CLI-Authentifizierung für az-Befehle
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

- [Checks vor der Bereitstellung](../chapter-06-pre-deployment/README.md)
- [Fehlerbehebung](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->