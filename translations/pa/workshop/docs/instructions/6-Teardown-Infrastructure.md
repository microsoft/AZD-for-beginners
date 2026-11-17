# 6. ਇੰਫਾਰਸਟਰੱਕਚਰ ਖਤਮ ਕਰਨਾ

!!! tip "ਇਸ ਮੋਡਿਊਲ ਦੇ ਅੰਤ ਤੱਕ ਤੁਸੀਂ ਇਹ ਕਰਨ ਦੇ ਯੋਗ ਹੋਵੋਗੇ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## ਬੋਨਸ ਅਭਿਆਸ

ਪ੍ਰੋਜੈਕਟ ਖਤਮ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਕੁਝ ਸਮਾਂ ਲੈ ਕੇ ਖੁੱਲ੍ਹੇ ਦਿਮਾਗ ਨਾਲ ਖੋਜ ਕਰਨਾ।

!!! info "ਇਹ ਖੋਜ ਪ੍ਰੇਰਣਾਵਾਂ ਨੂੰ ਅਜ਼ਮਾਓ"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## ਇੰਫਾਰਸਟਰੱਖਰ ਨੂੰ ਡਿਪ੍ਰੋਵੀਜ਼ਨ ਕਰੋ

!!! warning "ਜੇ ਤੁਸੀਂ GA ਹੋਸਟ ਕੀਤੇ ਏਜੰਟ ਅභਿਆਸ ਨੂੰ ਵੀ ਪੂਰਾ ਕੀਤਾ ਹੈ"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. ਇੰਫਾਰਸਟਰੱਖਰ ਨੂੰ ਖਤਮ ਕਰਨਾ ਇਸ ਤਰ੍ਹਾਂ ਆਸਾਨ ਹੈ:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. ਚੁਣਿਆ ਹੋਇਆ ਵਾਤਾਵਰਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ ਅਤੇ ਮਿਟਾਏ ਜਾਣ ਵਾਲੇ ਸਾਧਨਾਂ ਦਾ ਸਮੀਖਿਆ ਕਰੋ। ਇਹ ਅਜ਼ੂਰ ਸਾਧਨਾਂ ਨੂੰ ਹਟਾਉਂਦਾ ਹੈ ਅਤੇ ਡਾਟਾ ਨਸ਼ਟ ਕਰ ਸਕਦਾ ਹੈ। ਇਸ ਸਿੱਖਣ ਸਮਰਥਾ ਲਈ ਪੁਸ਼ਟੀ ਪ੍ਰਕਾਰਮ ਨੂੰ ਰੱਖੋ। ਇੱਕ ਵਾਰੀ ਮੁਕੰਮਲ ਹੋਣ 'ਤੇ ਤੁਸੀਂ ਇਸ ਤਰ੍ਹਾਂ ਦੀ ਆਉਟਪੁੱਟ ਵੇਖੋਗੇ:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. ਪੋਰਟਲ ਵਿੱਚ ਮਿਟਾਉਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਸਕੋਪ ਤੋਂ ਬਾਹਰ ਸਾਧਨਾਂ ਦੀ ਜਾਂਚ ਕਰੋ। ਖਰਚਾ ਰਿਪੋਰਟਿੰਗ ਅਤੇ ਕੋਟਾ ਅਪਡੇਟ ਵਿੱਚ ਦੇਰੀ ਹੋ ਸਕਦੀ ਹੈ। ਸਥਾਨਕ `.azure` ਸੰਰਚਨਾ ਰਹਿੰਦੀ ਹੈ ਜਦ ਤਕ ਤੁਸੀਂ ਸਪਸ਼ਟ ਤੌਰ 'ਤੇ ਇਸਨੂੰ ਹਟਾਉਂਦੇ ਨਹੀਂ।

1. `azd down --purge` ਹੋਰ ਸਹਾਇਤਾ ਪ੍ਰਾਪਤ ਸੌਫਟ-ਡਿਲੀਟ ਕੀਤੇ ਗਏ ਸਾਧਨਾਂ ਦੀ ਸਥਾਈ ਮਿਟਾਈ ਦੀ ਮੰਗ ਕਰਦਾ ਹੈ। ਇਹ ਗਤੀਵਿਧੀ ਕੇਵਲ ਉਸ ਵੇਲੇ ਇਸਤੇਮਾਲ ਕਰੋ ਜਦ ਬਹਾਲੀ ਦੀ ਲੋੜ ਨਾ ਹੋਵੇ ਅਤੇ ਤੁਸੀਂ ਰਿਟੈਨਸ਼ਨ/ਪੁਰਜ-ਰੱਖਿਆ ਨੀਤੀਆਂ ਨੂੰ ਸਮਝਦੇ ਹੋ। ਇਸ ਨਾਲ ਤੁਰੰਤ ਕੋਟਾ ਰਿਹਾਈ ਦੀ ਗੈਰੰਟੀ ਨਹੀਂ ਹੈ।

1. ਸਾਫ਼-ਸੁਥਰਾ ਕਰਨ ਲਈ ਸਿਰਫ਼ ਪੁਸ਼ਟੀ ਕਰਨ ਵਾਸਤੇ ਮੁੜ ਤੈਅ ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਨਾ ਕਰੋ। ਬਾਅਦ ਵਿੱਚ ਜਾਣਬੂਝ ਕੇ ਕੀਤੀ گئی `azd up` ਬਾਕੀ ਸਥਾਨਕ ਇਨਪੁੱਟਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਸਾਧਨ ਮੁੜ ਬਣਾਉਂਦਾ ਹੈ ਅਤੇ ਮੁੜ ਖਰਚਾ ਲੱਗਦਾ ਹੈ। ਮਾਡਲ ਅਪਡੇਟ ਆਮ ਤੌਰ 'ਤੇ ਸਮਰਥਿਤ ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ ਬਦਲਾਵਾਂ ਜਾਣੀਂ ਜਾਂਦੇ ਹਨ, ਨਾ ਕਿ ਇੰਫਾਰਸਟਰੱਖਰ ਖਤਮ ਕਰਨ ਨਾਲ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->