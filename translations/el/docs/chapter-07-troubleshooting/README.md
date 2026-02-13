# Κεφάλαιο 7: Αντιμετώπιση προβλημάτων & Εντοπισμός σφαλμάτων

**📚 Μάθημα**: [AZD Για Αρχάριους](../../README.md) | **⏱️ Διάρκεια**: 1-1.5 ώρες | **⭐ Πολυπλοκότητα**: Ενδιάμεσο

---

## Επισκόπηση

Αυτό το κεφάλαιο σας βοηθά να διαγνώσετε και να επιλύσετε συνήθη προβλήματα όταν εργάζεστε με το Azure Developer CLI. Από αποτυχίες ανάπτυξης έως προβλήματα ειδικά για AI.

## Στόχοι Μάθησης

Με την ολοκλήρωση αυτού του κεφαλαίου, θα:
- Διαγνώσετε συνηθισμένες αποτυχίες ανάπτυξης του AZD
- Εντοπίσετε σφάλματα πιστοποίησης και δικαιωμάτων
- Επιδιορθώσετε προβλήματα συνδεσιμότητας υπηρεσιών AI
- Χρησιμοποιήσετε το Azure Portal και το CLI για αντιμετώπιση προβλημάτων

---

## 📚 Μαθήματα

| # | Μάθημα | Περιγραφή | Χρόνος |
|---|--------|-------------|------|
| 1 | [Συνήθη Προβλήματα](common-issues.md) | Συχνά αντιμετωπιζόμενα προβλήματα | 30 λεπ. |
| 2 | [Οδηγός Εντοπισμού Σφαλμάτων](debugging.md) | Βήμα-βήμα στρατηγικές εντοπισμού σφαλμάτων | 45 λεπ. |
| 3 | [Αντιμετώπιση προβλημάτων AI](ai-troubleshooting.md) | Προβλήματα ειδικά για AI | 30 λεπ. |

---

## 🚨 Γρήγορες Επιδιορθώσεις

### Προβλήματα αυθεντικοποίησης
```bash
azd auth login
az login
azd auth whoami
```

### Αποτυχίες παροχής πόρων
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Συγκρούσεις πόρων
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Όριο εξαντλήθηκε
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Αναφορά Κωδικών Σφαλμάτων

| Error | Cause | Solution |
|-------|-------|----------|
| `AuthenticationError` | Δεν έχετε συνδεθεί | `azd auth login` |
| `ResourceNotFound` | Λείπει πόρος | Check resource names |
| `QuotaExceeded` | Όρια συνδρομής | Request quota increase |
| `InvalidTemplate` | Σφάλμα σύνταξης Bicep | `az bicep build` |
| `Conflict` | Resource exists | Use new name or delete |
| `Forbidden` | Ανεπαρκή δικαιώματα | Check RBAC roles |

---

## 🔄 Επαναφορά και Ανάκτηση

```bash
# Μαλακή επαναφορά (διατήρηση πόρων, επανανάπτυξη κώδικα)
azd deploy --force

# Σκληρή επαναφορά (διαγραφή όλων, ξεκίνημα από την αρχή)
azd down --force --purge
azd up
```

---

## 🔗 Πλοήγηση

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Κεφάλαιο 6: Προ-Ανάπτυξη](../chapter-06-pre-deployment/README.md) |
| **Next** | [Κεφάλαιο 8: Παραγωγή](../chapter-08-production/README.md) |

---

## 📖 Σχετικοί Πόροι

- [Έλεγχοι Προ-Ανάπτυξης](../chapter-06-pre-deployment/preflight-checks.md)
- [Οδηγός Ρυθμίσεων](../chapter-03-configuration/configuration.md)
- [Θέματα AZD στο GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη Co-op Translator (https://github.com/Azure/co-op-translator). Παρότι επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα του πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από ανθρώπινο μεταφραστή. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->