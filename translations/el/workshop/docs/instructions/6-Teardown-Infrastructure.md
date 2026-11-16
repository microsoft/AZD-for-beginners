# 6. Καταστροφή Υποδομής

!!! tip "ΜΕΧΡΙ ΤΗ ΛΗΞΗ ΤΟΥ ΑΥΤΟΥ ΤΟΥ ΜΑΘΗΜΑΤΟΣ ΘΑ ΜΠΟΡΕΙΤΕ ΝΑ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Πρόσθετες Ασκήσεις

Πριν καταστρέψουμε το έργο, αφιερώστε μερικά λεπτά για να κάνετε μια διερευνητική εξερεύνηση.

!!! info "Δοκιμάστε αυτές τις προτροπές εξερεύνησης"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Αποµακρυνση Υποδομής

1. Η καταστροφή της υποδομής είναι το ίδιο εύκολη με:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Επιβεβαιώστε το επιλεγμένο περιβάλλον και εξετάστε τους πόρους που θα διαγραφούν. Αυτό αφαιρεί πόρους Azure και μπορεί να καταστρέψει δεδομένα. Κρατήστε την προτροπή επιβεβαίωσης για αυτή τη διαδικασία μάθησης. Μόλις ολοκληρωθεί, θα δείτε έξοδο παρόμοια με:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Επαληθεύστε τη διαγραφή στο portal και ελέγξτε για πόρους εκτός του πεδίου εφαρμογής της ανάπτυξης. Οι αναφορές κόστους και οι ενημερώσεις των ποσοστώσεων μπορεί να καθυστερήσουν. Η τοπική `.azure` ρύθμιση παραμένει εκτός αν την αφαιρέσετε ρητά.

1. Το `azd down --purge` ζητά επίσης μόνιμη διαγραφή υποστηριζόμενων πόρων που έχουν διαγραφεί 'soft'. Χρησιμοποιήστε το μόνο όταν δεν απαιτείται αποκατάσταση και κατανοείτε τις πολιτικές διατήρησης/προστασίας καθαρισμού. Δεν εγγυάται άμεση απελευθέρωση ποσοστώσεων.

1. Μην αναπτύσσετε ξανά μόνο για να επαληθεύσετε τον καθαρισμό. Μια μετέπειτα σκόπιμη `azd up` μπορεί να δημιουργήσει ξανά πόρους χρησιμοποιώντας τις υπόλοιπες τοπικές εισόδους και επιφέρει χρεώσεις ξανά. Οι ενημερώσεις μοντέλου συνήθως χρησιμοποιούν υποστηριζόμενες αλλαγές παροχής, όχι καταστροφή.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->