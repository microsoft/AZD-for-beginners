# Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στην Τεχνητή Νοημοσύνη

**📚 Μάθημα**: [AZD για Αρχάριους](../../README.md) | **⏱️ Διάρκεια**: 1-2 hours | **⭐ Πολυπλοκότητα**: Ενδιάμεσο

---

## Επισκόπηση

Αυτό το κεφάλαιο επικεντρώνεται στην ανάπτυξη εφαρμογών με Τεχνητή Νοημοσύνη χρησιμοποιώντας το Azure Developer CLI και τις υπηρεσίες Microsoft Foundry. Από απλές εφαρμογές συνομιλίας με ΤΝ μέχρι ευφυείς πράκτορες με εργαλεία.

## Στόχοι Μάθησης

By completing this chapter, you will:
- Αναπτύξτε εφαρμογές με ΤΝ χρησιμοποιώντας έτοιμα πρότυπα AZD
- Κατανοήστε την ενσωμάτωση του Microsoft Foundry με το AZD
- Διαμορφώστε και προσαρμόστε πράκτορες ΤΝ με εργαλεία
- Αναπτύξτε εφαρμογές RAG (Retrieval-Augmented Generation)

---

## 📚 Μαθήματα

| # | Μάθημα | Περιγραφή | Χρόνος |
|---|--------|-------------|------|
| 1 | [Ενσωμάτωση Microsoft Foundry](microsoft-foundry-integration.md) | Συνδέστε το AZD με τις υπηρεσίες Foundry | 30 λεπτά |
| 2 | [Οδηγός για Πράκτορες ΤΝ](agents.md) | Αναπτύξτε ευφυείς πράκτορες με εργαλεία | 45 λεπτά |
| 3 | [Ανάπτυξη Μοντέλων ΤΝ](ai-model-deployment.md) | Αναπτύξτε και διαμορφώστε μοντέλα ΤΝ | 30 λεπτά |
| 4 | [Εργαστήριο ΤΝ](ai-workshop-lab.md) | Πρακτική άσκηση: Κάντε τη λύση ΤΝ έτοιμη για AZD | 60 λεπτά |

---

## 🚀 Γρήγορη Εκκίνηση

```bash
# Επιλογή 1: Εφαρμογή συνομιλίας RAG
azd init --template azure-search-openai-demo
azd up

# Επιλογή 2: Πράκτορες Τεχνητής Νοημοσύνης
azd init --template get-started-with-ai-agents
azd up

# Επιλογή 3: Γρήγορη εφαρμογή συνομιλίας
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Επιλεγμένα Πρότυπα ΤΝ

| Πρότυπο | Περιγραφή | Υπηρεσίες |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Συνομιλία RAG με αναφορές | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Πράκτορας ΤΝ με εργαλεία | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Βασική συνομιλία ΤΝ | OpenAI + Container Apps |

---

## 💰 Εκτίμηση Κόστους

| Περιβάλλον | Εκτιμώμενο Μηνιαίο Κόστος |
|-------------|----------------------|
| Ανάπτυξη | $80-150 |
| Δοκιμαστικό | $150-300 |
| Παραγωγή | $300-3,500+ |

**Συμβουλή:** Εκτελέστε `azd down` μετά τις δοκιμές για να αποφύγετε χρεώσεις.

---

## 🔗 Πλοήγηση

| Κατεύθυνση | Κεφάλαιο |
|-----------|---------|
| **Προηγούμενο** | [Κεφάλαιο 1: Foundation](../chapter-01-foundation/README.md) |
| **Επόμενο** | [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/README.md) |
| **Μετάβαση σε** | [Κεφάλαιο 8: Πρότυπα Παραγωγής](../chapter-08-production/README.md) |

---

## 📖 Σχετικοί Πόροι

- [Αντιμετώπιση προβλημάτων ΤΝ](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Πρακτικές Παραγωγής ΤΝ](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας υπηρεσία αυτόματης μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρότι επιδιώκουμε την ακρίβεια, σημειώστε ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα του πρέπει να θεωρείται η έγκυρη πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από άνθρωπο. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->