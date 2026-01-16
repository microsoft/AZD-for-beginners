<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-24T13:43:21+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "mr"
}
-->
# 6. इन्फ्रास्ट्रक्चर बंद करणे

!!! tip "या मॉड्यूलच्या शेवटी तुम्ही हे करू शकाल"

    - [ ] आयटम
    - [ ] आयटम
    - [ ] आयटम

---

## बोनस सराव

प्रकल्प बंद करण्यापूर्वी, काही वेळ काढून मुक्त अन्वेषण करा.

!!! danger "NITYA-TODO: काही प्रॉम्प्ट्स तयार करा"

---

## इन्फ्रास्ट्रक्चर डीप्रोव्हिजन करा

1. इन्फ्रास्ट्रक्चर बंद करणे इतके सोपे आहे:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. `--purge` फ्लॅग सुनिश्चित करतो की ते सॉफ्ट-डिलीट केलेल्या Cognitive Service संसाधनांनाही हटवते, ज्यामुळे या संसाधनांनी घेतलेला कोटा मुक्त होतो. पूर्ण झाल्यावर तुम्हाला असे काही दिसेल:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (पर्यायी) जर तुम्ही आता `azd up` पुन्हा चालवले, तर तुम्हाला लक्षात येईल की gpt-4.1 मॉडेल तैनात केले जाते कारण पर्यावरणीय व्हेरिएबल स्थानिक `.azure` फोल्डरमध्ये बदलले (आणि सेव्ह केले) गेले आहे.

      मॉडेल तैनाती **पूर्वी** अशी होती:

      ![Initial](../../../../../translated_images/mr/14-deploy-initial.30e4cf1c29b587bc.png)

      आणि ती **नंतर** अशी आहे:
      ![New](../../../../../translated_images/mr/14-deploy-new.f7f3c355a3cf7299.png)

---

