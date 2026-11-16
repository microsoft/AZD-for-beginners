# 6. ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਹਟਾਉਣਾ

!!! tip "ਇਸ ਮੋਡੀਊਲ ਦੇ ਅੰਤ ਤੱਕ ਤੁਸੀਂ ਇਹ ਕਰ ਸਕੋਗੇ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## ਇਨਾਮੀ ਕਸਰਤਾਂ

ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਹਟਾਉਣ ਤੋਂ ਪਹਿਲਾਂ, ਕੁਝ ਮਿੰਟ ਖੁੱਲ੍ਹੇ ਢੰਗ ਨਾਲ ਖੋਜ ਕਰਨ ਲਈ ਲਓ।

!!! info "ਇਹਨਾਂ ਖੋਜ ਸਵਾਲਾਂ ਨੂੰ ਕੋਸ਼ਿਸ਼ ਕਰੋ"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## ਇੰਫਰਾਸਟਰੱਕਚਰ ਬੰਦ ਕਰੋ

1. ਇੰਫਰਾਸਟਰੱਕਚਰ ਨੂੰ ਹਟਾਉਣਾ ਇੰਨਾ ਅਸਾਨ ਹੈ:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. ਚੁਣੀ ਹੋਈ ਵਾਤਾਵਰਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ ਅਤੇ ਮਿਟਾਏ ਜਾਣ ਵਾਲੇ ਸਰੋਤਾਂ ਦੀ ਸਮੀਖਿਆ ਕਰੋ। ਇਸ ਨਾਲ Azure ਸਰੋਤਾਂ ਨੂੰ ਹਟਾਇਆ ਜਾ ਸਕਦਾ ਹੈ ਅਤੇ ਡਾਟਾ ਨੂੰ ਨਸ਼ਟ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ। ਇਸ ਸਿੱਖਣ ਵਾਲੀ ਪ੍ਰਕਿਰਿਆ ਲਈ ਪੁਸ਼ਟੀ ਪ੍ਰੰਪਟ ਰੱਖੋ। ਮੁਕੰਮਲ ਹੋਣ 'ਤੇ ਤੁਹਾਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਦਾ ਨਤੀਜਾ ਦੇਖਣ ਨੂੰ ਮਿਲੇਗਾ:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. ਪੋਰਟਲ ਵਿੱਚ ਮਿਟਾਉਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ ਅਤੇ ਤਾਇਨਾਤੀ ਦੇ ਘੇਰੇ ਤੋਂ ਬਾਹਰ ਸਰੋਤਾਂ ਦੀ ਜਾਂਚ ਕਰੋ। ਲਾਗਤ ਰਿਪੋਰਟਿੰਗ ਅਤੇ ਕੋਟਾ ਅੱਪਡੇਟ ਵਿੱਚ ਦੇਰੀ ਹੋ ਸਕਦੀ ਹੈ। ਸਥਾਨਕ `.azure` ਸੰਰਚਨਾ ਬਰਕਰਾਰ ਰਹਿੰਦੀ ਹੈ ਜਦ ਤੱਕ ਤੁਸੀਂ ਇਸਨੂੰ ਖਾਸ ਤੌਰ 'ਤੇ ਨਾ ਹਟਾਓ।

1. `azd down --purge` ਸਹਾਇਤਾ ਪ੍ਰਾਪਤ ਸੋਫਟ-ਮਿਟਾਏ ਗਏ ਸਰੋਤਾਂ ਦੀ ਸਥਾਈ ਮਿਟਾਈ ਦੀ ਮੰਗ ਕਰਦਾ ਹੈ। ਇਸਨੂੰ ਸਿਰਫ਼ ਤਦ ਹੀ ਵਰਤੋਂ ਜਦੋਂ ਮੁੜ ਪ੍ਰਾਪਤੀ ਦੀ ਲੋੜ ਨਾ ਹੋਵੇ ਅਤੇ ਤੁਸੀਂ ਰੱਖ-ਰਖਾਵ/ਪੁਰਜ ਸੁਰੱਖਿਆ ਨੀਤੀਆਂ ਨੂੰ ਸਮਝਦੇ ਹੋ। ਇਹ ਤੁਰੰਤ ਕੋਟਾ ਰਿਹਾਈ ਦੀ ਗਾਰੰਟੀ ਨਹੀਂ ਦਿੰਦਾ।

1. ਸਾਫ਼ ਸਫਾਈ ਦੀ ਜਾਂਚ ਲਈ ਮੁੜ ਤਾਇਨਾਤ ਨਾ ਕਰੋ। ਬਾਅਦ ਵਿੱਚ ਜਾਣ-ਬੂਝ ਕੇ ਕੀਤੀ ਗਈ `azd up` ਬਚੇ ਹੋਏ ਸਥਾਨਕ ਇਨਪੁਟਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਸਰੋਤਾਂ ਨੂੰ ਦੁਬਾਰਾ ਬਣਾਈ ਸਕਦੀ ਹੈ ਅਤੇ ਮੁੜ ਚਾਰਜ ਲੱਗਦਾ ਹੈ। ਮਾਡਲ ਅੱਪਡੇਟ ਆਮ ਤੌਰ 'ਤੇ ਸਹਾਇਤਾ ਪ੍ਰਾਪਤ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਬਦਲਾਅ ਵਰਤਦਾ ਹੈ, ਨਾ ਕਿ ਹਟਾਉਣਾ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->