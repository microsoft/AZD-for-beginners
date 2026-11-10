# Κεφάλαιο 4: Υποδομή ως Κώδικας & Ανάπτυξη

**📚 Μάθημα**: [AZD Για Αρχάριους](../../README.md) | **⏱️ Διάρκεια**: 2-3 ώρες ανάγνωσης; επιτρέψτε επιπλέον χρόνο για ασκήσεις ανάπτυξης | **⭐ Πολυπλοκότητα**: Μεσαίο

---

## Επισκόπηση

Αυτό το κεφάλαιο καλύπτει μοτίβα Υποδομής ως Κώδικας (IaC) με πρότυπα Bicep, παροχή πόρων και στρατηγικές ανάπτυξης χρησιμοποιώντας το Azure Developer CLI.

> Στόχος επανεξέτασης εντολών και ρυθμίσεων: `azd 1.37.2` (Νοέμβριος 2026). Η ζωντανή παροχή Azure δεν εκτελέστηκε κατά την επανεξέταση.

## Μαθησιακοί Στόχοι

Με την ολοκλήρωση αυτού του κεφαλαίου, θα μπορέσετε να:
- Κατανοήσετε τη δομή και τη σύνταξη των προτύπων Bicep
- Παρέχετε πόρους Azure με `azd provision`
- Αναπτύξετε εφαρμογές με `azd deploy`
- Εφαρμόσετε στρατηγικές ανάπτυξης blue-green και rolling

---

## 📚 Μαθήματα

| # | Μάθημα | Περιγραφή | Χρόνος |
|---|--------|-------------|------|
| 1 | [Προμήθεια Πόρων](provisioning.md) | Διαχείριση πόρων Azure με AZD | 45 λεπτά |
| 2 | [Οδηγός Ανάπτυξης](deployment-guide.md) | Στρατηγικές ανάπτυξης εφαρμογών | 45 λεπτά |
| 3 | [Δημιουργία του Δικού σας Προτύπου](custom-templates.md) | Δημιουργία και δημοσίευση επαναχρησιμοποιήσιμων προτύπων azd | 30 λεπτά |

---

## 🚀 Γρήγορη Εκκίνηση

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 Δομή Έργου AZD

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

## 🔧 Βασικές Εντολές

| Εντολή | Περιγραφή |
|---------|-------------|
| `azd init` | Αρχικοποίηση έργου |
| `azd provision` | Δημιουργία πόρων Azure |
| `azd deploy` | Ανάπτυξη κώδικα εφαρμογής |
| `azd up` | παροχή + ανάπτυξη |
| `azd down` | Διαγραφή όλων των πόρων |

---

## 🔗 Πλοήγηση

| Κατεύθυνση | Κεφάλαιο |
|-----------|---------|
| **Προηγούμενο** | [Κεφάλαιο 3: Ρύθμιση](../chapter-03-configuration/README.md) |
| **Επόμενο** | [Κεφάλαιο 5: Πολυ-Πρακτορικές Λύσεις](../chapter-05-multi-agent/README.md) |

---

## 📖 Σχετικοί Πόροι

- [Έλεγχοι πριν την Ανάπτυξη](../chapter-06-pre-deployment/README.md)
- [Παραδείγματα Container App](../../examples/container-app/README.md)
- [Παράδειγμα Εφαρμογής Βάσης Δεδομένων](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->