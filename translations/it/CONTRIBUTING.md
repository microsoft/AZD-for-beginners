# Contribuire a AZD For Beginners

Grazie per il tuo interesse a contribuire al corso AZD For Beginners! Questo documento fornisce linee guida e informazioni per i contributori.

## Come Contribuire

### Segnalazione dei Problemi

Se trovi bug, errori o hai suggerimenti per miglioramenti:

1. **Controlla i Problemi Esistenti**: Cerca tra i [problemi esistenti](https://github.com/microsoft/azd-for-beginners/issues) per evitare duplicati
2. **Crea un Nuovo Problema**: Usa il template problema appropriato
3. **Fornisci Dettagli**: Includi i passaggi per riprodurre, il comportamento previsto e screenshot se applicabile

### Proposta di Modifiche

1. **Forka il Repository**: Crea un tuo fork del progetto
2. **Crea un Branch**: Crea un branch funzionale per le tue modifiche
3. **Effettua le Modifiche**: Segui i nostri standard di codifica e documentazione
4. **Testa le Tue Modifiche**: Verifica che tutti i link funzionino e che il contenuto venga visualizzato correttamente
5. **Invia una Pull Request**: Fornisci una descrizione chiara delle tue modifiche

### Tipi di Contributi

Accogliamo con favore i seguenti tipi di contributi:

#### Miglioramenti al Contenuto
- Correzione di errori di battitura, grammatica e formato
- Miglioramento della chiarezza della documentazione esistente
- Aggiornamento di informazioni obsolete
- Aggiunta di spiegazioni o contesto mancanti

#### Nuovi Esempi
- Aggiunta di scenari di deployment reali
- Creazione di nuovi template AZD per casi d'uso comuni
- Fornitura di ulteriori esempi di codice ed esercizi

#### Supporto alla Traduzione
- Aiuto nella manutenzione delle traduzioni esistenti
- Miglioramento della qualità delle traduzioni
- Aggiunta di traduzioni per nuovo contenuto

#### Segnalazioni di Bug
- Segnalazione di link rotti o esempi di codice errati
- Individuazione di incoerenze nella documentazione
- Segnalazione di problemi di accessibilità

## Linee Guida per il Contributo

### Standard della Documentazione

- Usa un linguaggio chiaro e adatto ai principianti
- Includi obiettivi di apprendimento e risultati
- Fornisci istruzioni passo-passo con output previsti
- Aggiungi link di navigazione a contenuti correlati
- Usa un formato e uno stile markdown coerenti

### Esempi di Codice

- Assicurati che tutti gli esempi di codice siano testati e funzionanti
- Includi commenti che spieghino i concetti chiave
- Segui le best practice di Azure e AZD
- Fornisci output previsti dove applicabile

### Validare la Documentazione in Inglese

Dalla root del repository, installa le attuali dipendenze di sviluppo ed esegui:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Il controllo link offline verifica i percorsi Markdown/HTML in inglese, le intestazioni, gli ancoraggi espliciti e i segnaposto di link vuoti. Esclude i `translations/` e `translated_images/` generati, inclusi i link verso quelle directory. Non recupera siti esterni né valida deployment Azure. Usa `--json <report-path>` per esportare gli errori e l'inventario URL esterno per un controllo di rete separato. Verifica i comandi upstream attuali e i prerequisiti esempi quando si cambiano istruzioni tecniche; distingui tra applicazioni testate e progetti di design.

### Messaggi di Commit

Usa messaggi di commit chiari e descrittivi:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Codice di Condotta

Ti preghiamo di leggere e seguire il nostro [Codice di Condotta](CODE_OF_CONDUCT.md) per mantenere una comunità accogliente e inclusiva.

## Ottenere Aiuto

- **Domande**: Cerca o apri un [issue su GitHub](https://github.com/microsoft/AZD-for-beginners/issues)
- **Comunità**: Unisciti al [Discord di Azure](https://discord.gg/microsoft-azure)
- **Documentazione**: Consulta la [documentazione Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Licenza

Contribuendo a questo repository, accetti che i tuoi contributi saranno concessi in licenza sotto la [Licenza MIT](../../LICENSE).

---

Grazie per aver aiutato a rendere AZD For Beginners una risorsa di apprendimento migliore per la comunità!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->