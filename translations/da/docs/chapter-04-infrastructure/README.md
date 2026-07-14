# Kapitel 4: Infrastruktur som kode & Udrulning  

**📚 Kursus**: [AZD For Begyndere](../../README.md) | **⏱️ Varighed**: 1-1.5 timer | **⭐ Sværhedsgrad**: Mellem  

---  

## Oversigt  

Dette kapitel dækker Infrastruktur som kode (IaC) mønstre med Bicep-skabeloner, ressourceforvaltning og udrulningsstrategier ved brug af Azure Developer CLI.  

> Valideret mod `azd 1.27.1` i juli 2026.  

## Læringsmål  

Når du har gennemført dette kapitel, vil du:  
- Forstå Bicep-skabelonens struktur og syntaks  
- Producere Azure-ressourcer med `azd provision`  
- Udrulle applikationer med `azd deploy`  
- Implementere blue-green og rolling udrulningsstrategier  

---  

## 📚 Lektioner  

| # | Lektion | Beskrivelse | Tid |  
|---|--------|-------------|------|  
| 1 | [Provisionering af ressourcer](provisioning.md) | Azure ressourceforvaltning med AZD | 45 min |  
| 2 | [Udrulningsguide](deployment-guide.md) | Applikationsudrulningsstrategier | 45 min |  
| 3 | [Forfatning af din egen skabelon](custom-templates.md) | Byg og publicer genanvendelige azd-skabeloner | 30 min |  

---  

## 🚀 Hurtig Start  

```bash
# Initialiser fra skabelon
azd init --template azure-functions-python-v2-http

# Forhåndsvis hvad der vil blive oprettet
azd provision --preview

# Udrul kun infrastruktur
azd provision

# Udrul kun kode
azd deploy

# Eller begge dele sammen
azd up
```
  
---  

## 📁 AZD Projektstruktur  

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```
  
---  

## 🔧 Væsentlige Kommandoer  

| Kommando | Beskrivelse |  
|---------|-------------|  
| `azd init` | Initialiser projekt |  
| `azd provision` | Opret Azure-ressourcer |  
| `azd deploy` | Udrul applikationskode |  
| `azd up` | provision + udrul |  
| `azd down` | Slet alle ressourcer |  

---  

## 🔗 Navigation  

| Retning | Kapitel |  
|-----------|---------|  
| **Forrige** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |  
| **Næste** | [Kapitel 5: Multi-Agent Løsninger](../chapter-05-multi-agent/README.md) |  

---  

## 📖 Relaterede Ressourcer  

- [Forudgående Udrulningskontroller](../chapter-06-pre-deployment/README.md)  
- [Container App Eksempler](../../examples/container-app/README.md)  
- [Database App Eksempel](../../examples/database-app/README.md)  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->