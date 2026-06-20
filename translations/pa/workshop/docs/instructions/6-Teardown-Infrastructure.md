# 6. ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਹਟਾਉਣਾ

!!! tip "ਇਸ ਮਾਡਿਊਲ ਦੇ ਅੰਤ ਤੱਕ ਤੁਸੀਂ ਇਹ ਕਰਨ ਦੇ ਯੋਗ ਹੋਵੋਗੇ"

    - [ ] ਰਿਸੋਰਸ ਸਾਫ਼-ਸਫਾਈ ਅਤੇ ਲਾਗਤ ਪ੍ਰਬੰਧਨ ਦੀ ਮਹੱਤਤਾ ਨੂੰ ਸਮਝੋ
    - [ ] ਸੁਰੱਖਿਅਤ ਤਰੀਕੇ ਨਾਲ ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਨੂੰ ਡੀਪ੍ਰੋਵਿਜ਼ਨ ਕਰਨ ਲਈ `azd down` ਦਾ ਪ੍ਰਯੋਗ ਕਰੋ
    - [ ] ਲੋੜ ਪੈਣ 'ਤੇ ਨਰਮ-ਤੌਰ 'ਤੇ ਮਿਟਾਏ ਗਏ Azure AI Services ਨੂੰ ਰਿਕਵਰ ਕਰੋ
    - [ ] **ਲੈਬ 6:** Azure ਸਰੋਤਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ ਅਤੇ ਹਟਾਉਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

---

## ਬੋਨਸ ਅਭਿਆਸ

ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਹਟਾਉਣ ਤੋਂ ਪਹਿਲਾਂ, ਕੁਝ ਮਿੰਟ ਖੁੱਲ੍ਹੇ-ਅੰਤ ਅਨੁਸੰਧਾਨ ਲਈ ਲਓ।

!!! info "ਇਹ ਖੋਜ ਪ੍ਰੰਪਟ ਅਜ਼ਮਾਓ"

    **GitHub Copilot ਨਾਲ ਪ੍ਰਯੋਗ ਕਰੋ:**
    
    1. ਪੁੱਛੋ: `What other AZD templates could I try for multi-agent scenarios?`
    2. ਪੁੱਛੋ: `How can I customize the agent instructions for a healthcare use case?`
    3. ਪੁੱਛੋ: `What environment variables control cost optimization?`
    
    **Azure ਪੋਰਟਲ ਦੀ ਖੋਜ ਕਰੋ:**
    
    1. ਆਪਣੀ ਡਿਪਲੋਇਮੈਂਟ ਲਈ Application Insights ਮੈਟ੍ਰਿਕਸ ਦੀ ਸਮੀਖਿਆ ਕਰੋ
    2. ਪ੍ਰੋਵਾਈਜ਼ਨ ਕੀਤੇ ਗਏ ਸਰੋਤਾਂ ਲਈ ਲਾਗਤ ਵਿਸ਼ਲੇਸ਼ਣ ਦੀ ਜਾਂਚ ਕਰੋ
    3. Microsoft Foundry ਪੋਰਟਲ ਦੇ ਏਜੰਟ ਪਲੇਗ੍ਰਾਉਂਡ ਦੀ ਇੱਕ ਵਾਰੀ ਫਿਰ ਖੋਜ ਕਰੋ

---

## ਇੰਫ੍ਰਾ ਡੀਪ੍ਰੋਵਿਜ਼ਨ

1. ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਨੂੰ ਬੰਦ/ਹਟਾਉਣਾ ਇੰਨਾ ਹੀ ਆਸਾਨ ਹੈ:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. The `--purge` flag ensures that it also purges soft-deleted Cognitive Service resources, thereby releasing quota held by these resources. Once complete you will see something like this:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (ਵਿਕਲਪਿਕ) ਜੇ ਤੁਸੀਂ ਹੁਣ ਦੁਬਾਰਾ `azd up` ਚਲਾਉਂਦੇ ਹੋ, ਤਾਂ ਤੁਸੀਂ ਦੇਖੋਗੇ ਕਿ gpt-4.1 ਮਾਡਲ ਡਿਪਲਾਇ ਹੋ ਜਾਂਦਾ ਹੈ ਕਿਉਂਕਿ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਨੂੰ ਬਦਲਿਆ ਗਿਆ (ਅਤੇ ਸਥਾਨਕ `.azure` ਫੋਲਡਰ ਵਿੱਚ ਸੇਵ ਕੀਤਾ ਗਿਆ) ਸੀ। 

      Here is the model deployments **before**:

      ![ਆਰੰਭਕ](../../../../../translated_images/pa/14-deploy-initial.30e4cf1c29b587bc.webp)

      And here it is **after**:
      ![ਨਵਾਂ](../../../../../translated_images/pa/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->