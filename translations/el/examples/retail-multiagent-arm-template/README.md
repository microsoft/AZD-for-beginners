# Λύση Λιανικής Πολλαπλών Πρακτόρων - Πρότυπο Υποδομής

**Κεφάλαιο 5: Πακέτο Ανάπτυξης Παραγωγής**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Σχετικό Κεφάλαιο**: [Κεφάλαιο 5: Λύσεις AI Πολλαπλών Πρακτόρων](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Οδηγός Σεναρίου**: [Πλήρης Αρχιτεκτονική](../retail-scenario.md)
- **🎯 Γρήγορη Ανάπτυξη**: [Ανάπτυξη με Ένα Κλικ](../../../../examples/retail-multiagent-arm-template)

> **⚠️ ΜΟΝΟ ΠΡΟΤΥΠΟ ΥΠΟΔΟΜΗΣ**  
> Αυτό το πρότυπο ARM αναπτύσσει **πόρους Azure** για ένα σύστημα πολλαπλών πρακτόρων.  
>  
> **Τι αναπτύσσεται (15-25 λεπτά):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings σε 3 περιοχές)
> - ✅ Υπηρεσία Αναζήτησης AI (κενή, έτοιμη για δημιουργία ευρετηρίου)
> - ✅ Εφαρμογές Container (εικόνες placeholder, έτοιμες για τον κώδικά σας)
> - ✅ Αποθήκευση, Cosmos DB, Key Vault, Application Insights
>  
> **Τι ΔΕΝ περιλαμβάνεται (απαιτεί ανάπτυξη):**
> - ❌ Κώδικας υλοποίησης πρακτόρων (Πράκτορας Πελάτη, Πράκτορας Αποθέματος)
> - ❌ Λογική δρομολόγησης και τελικά σημεία API
> - ❌ UI συνομιλίας στο frontend
> - ❌ Σχήματα ευρετηρίου αναζήτησης και αγωγοί δεδομένων
> - ❌ **Εκτιμώμενη προσπάθεια ανάπτυξης: 80-120 ώρες**
>  
> **Χρησιμοποιήστε αυτό το πρότυπο αν:**
> - ✅ Θέλετε να προμηθεύσετε υποδομή Azure για ένα έργο πολλαπλών πρακτόρων
> - ✅ Σκοπεύετε να αναπτύξετε την υλοποίηση πρακτόρων ξεχωριστά
> - ✅ Χρειάζεστε μια υποδομή έτοιμη για παραγωγή
>  
> **Μην το χρησιμοποιήσετε αν:**
> - ❌ Περιμένετε ένα λειτουργικό demo πολλαπλών πρακτόρων άμεσα
> - ❌ Ψάχνετε για πλήρη παραδείγματα κώδικα εφαρμογής

## Επισκόπηση

Αυτός ο φάκελος περιέχει ένα ολοκληρωμένο πρότυπο Azure Resource Manager (ARM) για την ανάπτυξη της **βάσης υποδομής** ενός συστήματος υποστήριξης πελατών πολλαπλών πρακτόρων. Το πρότυπο προμηθεύει όλες τις απαραίτητες υπηρεσίες Azure, σωστά διαμορφωμένες και διασυνδεδεμένες, έτοιμες για την ανάπτυξη της εφαρμογής σας.

**Μετά την ανάπτυξη, θα έχετε:** Υποδομή Azure έτοιμη για παραγωγή  
**Για να ολοκληρώσετε το σύστημα, χρειάζεστε:** Κώδικα πρακτόρων, UI στο frontend και διαμόρφωση δεδομένων (δείτε [Οδηγό Αρχιτεκτονικής](../retail-scenario.md))

## 🎯 Τι Αναπτύσσεται

### Βασική Υποδομή (Κατάσταση Μετά την Ανάπτυξη)

✅ **Υπηρεσίες Azure OpenAI** (Έτοιμες για κλήσεις API)
  - Κύρια περιοχή: Ανάπτυξη GPT-4o (χωρητικότητα 20K TPM)
  - Δευτερεύουσα περιοχή: Ανάπτυξη GPT-4o-mini (χωρητικότητα 10K TPM)
  - Τριτογενής περιοχή: Μοντέλο embeddings κειμένου (χωρητικότητα 30K TPM)
  - Περιοχή αξιολόγησης: Μοντέλο grader GPT-4o (χωρητικότητα 15K TPM)
  - **Κατάσταση:** Πλήρως λειτουργικό - μπορεί να κάνει κλήσεις API άμεσα

✅ **Υπηρεσία Αναζήτησης AI** (Κενή - έτοιμη για διαμόρφωση)
  - Ενεργοποιημένες δυνατότητες αναζήτησης vector
  - Τυπική βαθμίδα με 1 διαμέρισμα, 1 αντίγραφο
  - **Κατάσταση:** Η υπηρεσία λειτουργεί, αλλά απαιτεί δημιουργία ευρετηρίου
  - **Απαιτούμενη ενέργεια:** Δημιουργήστε ευρετήριο αναζήτησης με το σχήμα σας

✅ **Λογαριασμός Αποθήκευσης Azure** (Κενός - έτοιμος για μεταφορτώσεις)
  - Δοχεία blob: `documents`, `uploads`
  - Ασφαλής διαμόρφωση (μόνο HTTPS, χωρίς δημόσια πρόσβαση)
  - **Κατάσταση:** Έτοιμος να δεχτεί αρχεία
  - **Απαιτούμενη ενέργεια:** Μεταφορτώστε τα δεδομένα προϊόντων και τα έγγραφά σας

⚠️ **Περιβάλλον Εφαρμογών Container** (Αναπτυγμένες εικόνες placeholder)
  - Εφαρμογή δρομολογητή πρακτόρων (προεπιλεγμένη εικόνα nginx)
  - Εφαρμογή frontend (προεπιλεγμένη εικόνα nginx)
  - Αυτόματη κλιμάκωση διαμορφωμένη (0-10 instances)
  - **Κατάσταση:** Εκτελούνται εικόνες placeholder
  - **Απαιτούμενη ενέργεια:** Δημιουργήστε και αναπτύξτε τις εφαρμογές πρακτόρων σας

✅ **Azure Cosmos DB** (Κενή - έτοιμη για δεδομένα)
  - Προδιαμορφωμένη βάση δεδομένων και δοχείο
  - Βελτιστοποιημένη για λειτουργίες χαμηλής καθυστέρησης
  - Ενεργοποιημένο TTL για αυτόματο καθαρισμό
  - **Κατάσταση:** Έτοιμη να αποθηκεύσει ιστορικό συνομιλιών

✅ **Azure Key Vault** (Προαιρετικό - έτοιμο για μυστικά)
  - Ενεργοποιημένη μαλακή διαγραφή
  - RBAC διαμορφωμένο για διαχειριζόμενες ταυτότητες
  - **Κατάσταση:** Έτοιμο να αποθηκεύσει κλειδιά API και συμβολοσειρές σύνδεσης

✅ **Application Insights** (Προαιρετικό - ενεργή παρακολούθηση)
  - Συνδεδεμένο με Log Analytics workspace
  - Προσαρμοσμένες μετρήσεις και ειδοποιήσεις διαμορφωμένες
  - **Κατάσταση:** Έτοιμο να λαμβάνει τηλεμετρία από τις εφαρμογές σας

✅ **Document Intelligence** (Έτοιμο για κλήσεις API)
  - Βαθμίδα S0 για φόρτους παραγωγής
  - **Κατάσταση:** Έτοιμο να επεξεργαστεί μεταφορτωμένα έγγραφα

✅ **Bing Search API** (Έτοιμο για κλήσεις API)
  - Βαθμίδα S1 για αναζητήσεις σε πραγματικό χρόνο
  - **Κατάσταση:** Έτοιμο για ερωτήματα αναζήτησης στο web

### Τρόποι Ανάπτυξης

| Τρόπος | Χωρητικότητα OpenAI | Instances Container | Βαθμίδα Αναζήτησης | Πλεονασμός Αποθήκευσης | Καλύτερο Για |
|-------|---------------------|---------------------|--------------------|-----------------------|--------------|
| **Ελάχιστο** | 10K-20K TPM | 0-2 αντίγραφα | Βασικό | LRS (Τοπικό) | Ανάπτυξη/δοκιμή, μάθηση, proof-of-concept |
| **Τυπικό** | 30K-60K TPM | 2-5 αντίγραφα | Τυπικό | ZRS (Ζώνη) | Παραγωγή, μέτρια κίνηση (<10K χρήστες) |
| **Premium** | 80K-150K TPM | 5-10 αντίγραφα, πλεονασμός ζώνης | Premium | GRS (Γεωγραφικό) | Επιχειρήσεις, υψηλή κίνηση (>10K χρήστες), SLA 99.99% |

**Επίδραση Κόστους:**
- **Ελάχιστο → Τυπικό:** ~4x αύξηση κόστους ($100-370/μήνα → $420-1,450/μήνα)
- **Τυπικό → Premium:** ~3x αύξηση κόστους ($420-1,450/μήνα → $1,150-3,500/μήνα)
- **Επιλέξτε βάσει:** Αναμενόμενου φορτίου, απαιτήσεων SLA, περιορισμών προϋπολογισμού

**Σχεδιασμός Χωρητικότητας:**
- **TPM (Tokens Per Minute):** Σύνολο σε όλες τις αναπτύξεις μοντέλων
- **Instances Container:** Εύρος αυτόματης κλιμάκωσης (ελάχιστο-μέγιστο αντίγραφα)
- **Βαθμίδα Αναζήτησης:** Επηρεάζει την απόδοση ερωτημάτων και τα όρια μεγέθους ευρετηρίου

## 📋 Προαπαιτούμενα

### Απαιτούμενα Εργαλεία
1. **Azure CLI** (έκδοση 2.50.0 ή νεότερη)
   ```bash
   az --version  # Έλεγχος έκδοσης
   az login      # Πιστοποίηση
   ```

2. **Ενεργή συνδρομή Azure** με πρόσβαση Ιδιοκτήτη ή Συνεισφέροντα
   ```bash
   az account show  # Επαλήθευση συνδρομής
   ```

### Απαιτούμενες Ποσότητες Azure

Πριν την ανάπτυξη, επαληθεύστε επαρκείς ποσότητες στις στοχευμένες περιοχές σας:

```bash
# Ελέγξτε τη διαθεσιμότητα του Azure OpenAI στην περιοχή σας
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Επαληθεύστε την ποσόστωση του OpenAI (παράδειγμα για gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Ελέγξτε την ποσόστωση των Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Ελάχιστες Απαιτούμενες Ποσότητες:**
- **Azure OpenAI:** 3-4 αναπτύξεις μοντέλων σε περιοχές
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Σημείωση:** Το GPT-4o μπορεί να έχει λίστα αναμονής σε ορισμένες περιοχές - ελέγξτε [διαθεσιμότητα μοντέλων](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Διαχειριζόμενο περιβάλλον + 2-10 instances container
- **AI Search:** Τυπική βαθμίδα (Βασική ανεπαρκής για αναζήτηση vector)
- **Cosmos DB:** Τυπική παροχή throughput

**Αν οι ποσότητες είναι ανεπαρκείς:**
1. Μεταβείτε στο Azure Portal → Ποσότητες → Αίτημα αύξησης
2. Ή χρησιμοποιήστε το Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Εξετάστε εναλλακτικές περιοχές με διαθεσιμότητα

## 🚀 Γρήγορη Ανάπτυξη

### Επιλογή 1: Χρήση Azure CLI

```bash
# Κλωνοποιήστε ή κατεβάστε τα αρχεία προτύπου
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Κάντε το σενάριο ανάπτυξης εκτελέσιμο
chmod +x deploy.sh

# Αναπτύξτε με τις προεπιλεγμένες ρυθμίσεις
./deploy.sh -g myResourceGroup

# Αναπτύξτε για παραγωγή με premium χαρακτηριστικά
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Επιλογή 2: Χρήση Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Επιλογή 3: Χρήση Azure CLI απευθείας

```bash
# Δημιουργία ομάδας πόρων
az group create --name myResourceGroup --location eastus2

# Ανάπτυξη προτύπου
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Χρονοδιάγραμμα Ανάπτυξης

### Τι να Περιμένετε

| Φάση | Διάρκεια | Τι Συμβαίνει |
|------|----------|-------------||
| **Επικύρωση Προτύπου** | 30-60 δευτερόλεπτα | Το Azure επικυρώνει τη σύνταξη και τις παραμέτρους του προτύπου ARM |
| **Ρύθμιση Ομάδας Πόρων** | 10-20 δευτερόλεπτα | Δημιουργεί ομάδα πόρων (αν χρειάζεται) |
| **Προμήθεια OpenAI** | 5-8 λεπτά | Δημιουργεί 3-4 λογαριασμούς OpenAI και αναπτύσσει μοντέλα |
| **Εφαρμογές Container** | 3-5 λεπτά | Δημιουργεί περιβάλλον και αναπτύσσει εικόνες placeholder |
| **Αναζήτηση & Αποθήκευση** | 2-4 λεπτά | Προμηθεύει υπηρεσία Αναζήτησης AI και λογαριασμούς αποθήκευσης |
| **Cosmos DB** | 2-3 λεπτά | Δημιουργεί βάση δεδομένων και διαμορφώνει δοχεία |
| **Ρύθμιση Παρακολούθησης** | 2-3 λεπτά | Ρυθμίζει Application Insights και Log Analytics |
| **Διαμόρφωση RBAC** | 1-2 λεπτά | Διαμορφώνει διαχειριζόμενες ταυτότητες και δικαιώματα |
| **Συνολική Ανάπτυξη** | **15-25 λεπτά** | Πλήρης υποδομή έτοιμη |

**Μετά την Ανάπτυξη:**
- ✅ **Υποδομή Έτοιμη:** Όλες οι υπηρεσίες Azure προμηθευμένες και λειτουργικές
- ⏱️ **Ανάπτυξη Εφαρμογής:** 80-120 ώρες (δική σας ευθύνη)
- ⏱️ **Διαμόρφωση Ευρετηρίου:** 15-30 λεπτά (απαιτεί το σχήμα σας)
- ⏱️ **Μεταφόρτωση Δεδομένων:** Εξαρτάται από το μέγεθος του συνόλου δεδομένων
- ⏱️ **Δοκιμή & Επικύρωση:** 2-4 ώρες

---

## ✅ Επαλήθευση Επιτυχίας Ανάπτυξης

### Βήμα 1: Έλεγχος Προμήθειας Πόρων (2 λεπτά)

```bash
# Επαληθεύστε ότι όλοι οι πόροι αναπτύχθηκαν με επιτυχία
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Αναμενόμενο:** Κενός πίνακας (όλοι οι πόροι εμφανίζουν κατάσταση "Succeeded")

### Βήμα 2: Επαλήθευση Αναπτύξεων Azure OpenAI (3 λεπτά)

```bash
# Καταγράψτε όλους τους λογαριασμούς OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Ελέγξτε τις αναπτύξεις μοντέλων για την κύρια περιοχή
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Αναμενόμενο:** 
- 3-4 λογαριασμοί OpenAI (κύρια, δευτερεύουσα, τριτογενής, περιοχές αξιολόγησης)
- 1-2 αναπτύξεις μοντέλων ανά λογαριασμό (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Βήμα 3: Δοκιμή Τελικών Σημείων Υποδομής (5 λεπτά)

```bash
# Λήψη URL εφαρμογών κοντέινερ
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Δοκιμή τελικού σημείου δρομολογητή (θα απαντήσει εικόνα κράτησης θέσης)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Αναμενόμενο:** 
- Οι Εφαρμογές Container εμφανίζουν κατάσταση "Running"
- Το placeholder nginx απαντά με HTTP 200 ή 404 (δεν υπάρχει κώδικας εφαρμογής ακόμα)

### Βήμα 4: Επαλήθευση Πρόσβασης API Azure OpenAI (3 λεπτά)

```bash
# Λάβετε το endpoint και το κλειδί του OpenAI
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Δοκιμάστε την ανάπτυξη του GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Αναμενόμενο:** JSON απάντηση με ολοκλήρωση συνομιλίας (επιβεβαιώνει ότι το OpenAI λειτουργεί)

### Τι Λειτουργεί vs. Τι Όχι

**✅ Λειτουργεί Μετά την Ανάπτυξη:**
- Τα μοντέλα Azure OpenAI αναπτύχθηκαν και δέχονται κλήσεις API
- Η υπηρεσία Αναζήτησης AI λειτουργεί (κενή, χωρίς ευρετήρια ακόμα)
- Οι Εφαρμογές Container λειτουργούν (εικόνες placeholder nginx)
- Οι λογαριασμοί αποθήκευσης είναι προσβάσιμοι και έτοιμοι για μεταφορτώσεις
- Το Cosmos DB έτοιμο για λειτουργίες δεδομένων
- Το Application Insights συλλέγει τηλεμετρία υποδομής
- Το Key Vault έτοιμο για αποθήκευση μυστικών

**❌ Δεν Λειτουργεί Ακόμα (Απαιτεί Ανάπτυξη):**
- Τελικά σημεία πρακτόρων (δεν έχει αναπτυχθεί κώδικας εφαρμογής)
- Λειτουργικότητα συνομιλίας (απαιτεί υλοποίηση frontend + backend)
- Ερωτήματα αναζήτησης (δεν έχει δημιουργηθεί ευρετήριο αναζήτησης ακόμα)
- Αγωγός επεξεργασίας εγγράφων (δεν έχουν μεταφορτωθεί δεδομένα)
- Προσαρμοσμένη τηλεμετρία (απαιτεί ενσωμάτωση εφαρμογής)

**Επόμενα Βήματα:** Δείτε [Διαμόρφωση Μετά την Ανάπτυξη](../../../../examples/retail-multiagent-arm-template) για να αναπτύξετε και να υλοποιήσετε την εφαρμογή σας

---

## ⚙️ Επιλογές Διαμόρφωσης

### Παράμετροι Προτύπου

| Παράμετρος | Τύπος | Προεπιλογ
> **📝 Σημαντικό:** Η υποδομή έχει αναπτυχθεί, αλλά πρέπει να αναπτύξετε και να αναπτύξετε τον κώδικα της εφαρμογής.

### Φάση 1: Ανάπτυξη Εφαρμογών Πρακτόρων (Δική σας Ευθύνη)

Το ARM template δημιουργεί **κενές Container Apps** με placeholder εικόνες nginx. Πρέπει να:

**Απαιτούμενη Ανάπτυξη:**
1. **Υλοποίηση Πρακτόρων** (30-40 ώρες)
   - Πράκτορας εξυπηρέτησης πελατών με ενσωμάτωση GPT-4o
   - Πράκτορας αποθεμάτων με ενσωμάτωση GPT-4o-mini
   - Λογική δρομολόγησης πρακτόρων

2. **Ανάπτυξη Frontend** (20-30 ώρες)
   - Διεπαφή συνομιλίας UI (React/Vue/Angular)
   - Λειτουργικότητα μεταφόρτωσης αρχείων
   - Απόδοση και μορφοποίηση απαντήσεων

3. **Υπηρεσίες Backend** (12-16 ώρες)
   - FastAPI ή Express router
   - Middleware αυθεντικοποίησης
   - Ενσωμάτωση τηλεμετρίας

**Δείτε:** [Οδηγός Αρχιτεκτονικής](../retail-scenario.md) για λεπτομερή πρότυπα υλοποίησης και παραδείγματα κώδικα

### Φάση 2: Διαμόρφωση Δείκτη Αναζήτησης AI (15-30 λεπτά)

Δημιουργήστε έναν δείκτη αναζήτησης που να ταιριάζει με το μοντέλο δεδομένων σας:

```bash
# Λάβετε λεπτομέρειες υπηρεσίας αναζήτησης
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Δημιουργήστε δείκτη με το σχήμα σας (παράδειγμα)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**Πόροι:**
- [Σχεδιασμός Σχήματος Δείκτη Αναζήτησης AI](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Διαμόρφωση Αναζήτησης Vector](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Φάση 3: Μεταφόρτωση Δεδομένων (Ο χρόνος ποικίλλει)

Μόλις έχετε δεδομένα προϊόντων και έγγραφα:

```bash
# Λάβετε λεπτομέρειες λογαριασμού αποθήκευσης
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Μεταφορτώστε τα έγγραφά σας
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Παράδειγμα: Μεταφόρτωση ενός αρχείου
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Φάση 4: Δημιουργία και Ανάπτυξη Εφαρμογών (8-12 ώρες)

Μόλις αναπτύξετε τον κώδικα των πρακτόρων σας:

```bash
# 1. Δημιουργήστε το Azure Container Registry (αν χρειάζεται)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Δημιουργήστε και προωθήστε την εικόνα του agent router
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Δημιουργήστε και προωθήστε την εικόνα του frontend
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Ενημερώστε τα Container Apps με τις εικόνες σας
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Διαμορφώστε τις μεταβλητές περιβάλλοντος
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Φάση 5: Δοκιμή Εφαρμογής (2-4 ώρες)

```bash
# Λάβετε το URL της εφαρμογής σας
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Δοκιμάστε το endpoint του agent (αφού αναπτυχθεί ο κώδικάς σας)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Ελέγξτε τα αρχεία καταγραφής της εφαρμογής
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Πόροι Υλοποίησης

**Αρχιτεκτονική & Σχεδιασμός:**
- 📖 [Πλήρης Οδηγός Αρχιτεκτονικής](../retail-scenario.md) - Λεπτομερή πρότυπα υλοποίησης
- 📖 [Πρότυπα Σχεδιασμού Πολλαπλών Πρακτόρων](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Παραδείγματα Κώδικα:**
- 🔗 [Δείγμα Συνομιλίας Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) - Πρότυπο RAG
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Πλαίσιο πρακτόρων (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Ορχήστρα πρακτόρων (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Συνομιλίες πολλαπλών πρακτόρων

**Εκτιμώμενη Συνολική Προσπάθεια:**
- Ανάπτυξη υποδομής: 15-25 λεπτά (✅ Ολοκληρωμένο)
- Ανάπτυξη εφαρμογών: 80-120 ώρες (🔨 Δική σας εργασία)
- Δοκιμή και βελτιστοποίηση: 15-25 ώρες (🔨 Δική σας εργασία)

## 🛠️ Αντιμετώπιση Προβλημάτων

### Συνηθισμένα Προβλήματα

#### 1. Υπέρβαση Ποσόστωσης Azure OpenAI

```bash
# Ελέγξτε την τρέχουσα χρήση ποσοστώσεων
az cognitiveservices usage list --location eastus2

# Αίτημα αύξησης ποσοστώσεων
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Αποτυχία Ανάπτυξης Container Apps

```bash
# Ελέγξτε τα αρχεία καταγραφής της εφαρμογής κοντέινερ
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Επανεκκινήστε την εφαρμογή κοντέινερ
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Αρχικοποίηση Υπηρεσίας Αναζήτησης

```bash
# Επαλήθευση κατάστασης της υπηρεσίας αναζήτησης
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Δοκιμή συνδεσιμότητας της υπηρεσίας αναζήτησης
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Επικύρωση Ανάπτυξης

```bash
# Επικύρωση ότι έχουν δημιουργηθεί όλοι οι πόροι
az resource list \
  --resource-group myResourceGroup \
  --output table

# Έλεγχος της κατάστασης υγείας των πόρων
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Σκέψεις Ασφαλείας

### Διαχείριση Κλειδιών
- Όλα τα μυστικά αποθηκεύονται στο Azure Key Vault (όταν είναι ενεργοποιημένο)
- Οι container apps χρησιμοποιούν διαχειριζόμενη ταυτότητα για αυθεντικοποίηση
- Οι λογαριασμοί αποθήκευσης έχουν ασφαλείς προεπιλογές (μόνο HTTPS, χωρίς δημόσια πρόσβαση σε blob)

### Ασφάλεια Δικτύου
- Οι container apps χρησιμοποιούν εσωτερική δικτύωση όπου είναι δυνατόν
- Η υπηρεσία αναζήτησης διαμορφώνεται με επιλογή ιδιωτικών τελικών σημείων
- Το Cosmos DB διαμορφώνεται με τις ελάχιστες απαραίτητες άδειες

### Διαμόρφωση RBAC
```bash
# Εκχώρηση απαραίτητων ρόλων για τη διαχειριζόμενη ταυτότητα
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Βελτιστοποίηση Κόστους

### Εκτιμήσεις Κόστους (Μηνιαία, USD)

| Λειτουργία | OpenAI | Container Apps | Αναζήτηση | Αποθήκευση | Συνολική Εκτίμηση |
|------------|--------|----------------|-----------|------------|-------------------|
| Ελάχιστη | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Κανονική | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Παρακολούθηση Κόστους

```bash
# Ρύθμιση ειδοποιήσεων προϋπολογισμού
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Ενημερώσεις και Συντήρηση

### Ενημερώσεις Template
- Διατηρήστε έκδοση των αρχείων ARM template
- Δοκιμάστε αλλαγές πρώτα σε περιβάλλον ανάπτυξης
- Χρησιμοποιήστε λειτουργία σταδιακής ανάπτυξης για ενημερώσεις

### Ενημερώσεις Πόρων
```bash
# Ενημέρωση με νέες παραμέτρους
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Αντίγραφα Ασφαλείας και Ανάκτηση
- Ενεργοποιημένο αυτόματο αντίγραφο ασφαλείας για Cosmos DB
- Ενεργοποιημένη μαλακή διαγραφή για Key Vault
- Διατηρούνται αναθεωρήσεις container app για επαναφορά

## 📞 Υποστήριξη

- **Προβλήματα Template**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Υποστήριξη Azure**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Κοινότητα**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Έτοιμοι να αναπτύξετε τη λύση πολλαπλών πρακτόρων σας;**

Ξεκινήστε με: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->