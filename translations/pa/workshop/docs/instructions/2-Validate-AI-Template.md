<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7816c6ec50c694c331e7c6092371be4d",
  "translation_date": "2025-09-24T15:01:30+00:00",
  "source_file": "workshop/docs/instructions/2-Validate-AI-Template.md",
  "language_code": "pa"
}
-->
# 2. ਟੈਂਪਲੇਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

!!! tip "ਇਸ ਮੋਡਿਊਲ ਦੇ ਅੰਤ ਤੱਕ ਤੁਸੀਂ ਇਹ ਕਰਨ ਦੇ ਯੋਗ ਹੋਵੋਗੇ"

    - [ ] AI ਹੱਲ ਦੀ ਆਰਕੀਟੈਕਚਰ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰੋ
    - [ ] AZD ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋ ਨੂੰ ਸਮਝੋ
    - [ ] AZD ਦੀ ਵਰਤੋਂ 'ਤੇ ਮਦਦ ਲਈ GitHub Copilot ਦੀ ਵਰਤੋਂ ਕਰੋ
    - [ ] **ਲੈਬ 2:** AI ਏਜੰਟਸ ਟੈਂਪਲੇਟ ਨੂੰ ਡਿਪਲੌਇ ਅਤੇ ਵੈਰੀਫਾਈ ਕਰੋ

---

## 1. ਜਾਣ ਪਛਾਣ

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ਜਾਂ `azd` ਇੱਕ ਖੁੱਲ੍ਹੇ ਸਰੋਤ ਵਾਲਾ ਕਮਾਂਡਲਾਈਨ ਟੂਲ ਹੈ ਜੋ Azure 'ਤੇ ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ ਅਤੇ ਡਿਪਲੌਇ ਕਰਨ ਦੌਰਾਨ ਡਿਵੈਲਪਰ ਵਰਕਫਲੋ ਨੂੰ ਸਧਾਰਨ ਬਣਾਉਂਦਾ ਹੈ।

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) ਮਿਆਰੀ ਰਿਪੋਜ਼ਿਟਰੀ ਹਨ ਜੋ ਨਮੂਨਾ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ, _ਇੰਫਰਾਸਟਰਕਚਰ ਐਜ਼ ਕੋਡ_ ਐਸੈਟਸ, ਅਤੇ `azd` ਕਨਫਿਗਰੇਸ਼ਨ ਫਾਈਲਾਂ ਨੂੰ ਇੱਕ ਸਹਿ-ਜੋੜੇ ਹੱਲ ਦੀ ਆਰਕੀਟੈਕਚਰ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰਦੇ ਹਨ। ਇੰਫਰਾਸਟਰਕਚਰ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ `azd provision` ਕਮਾਂਡ ਜਿੰਨੀ ਸਧਾਰਨ ਬਣ ਜਾਂਦੀ ਹੈ - ਜਦੋਂ ਕਿ `azd up` ਦੀ ਵਰਤੋਂ ਕਰਨ ਨਾਲ ਤੁਹਾਡੀ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਇੱਕ ਹੀ ਵਾਰ ਵਿੱਚ ਪ੍ਰੋਵਿਜ਼ਨ ਅਤੇ ਡਿਪਲੌਇ ਕਰਨ ਦੀ ਆਗਿਆ ਮਿਲਦੀ ਹੈ!

ਨਤੀਜੇ ਵਜੋਂ, ਤੁਹਾਡੀ ਐਪਲੀਕੇਸ਼ਨ ਡਿਵੈਲਪਮੈਂਟ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਸ਼ੁਰੂ ਕਰਨਾ ਜਿੰਨਾ ਸਧਾਰਨ ਹੋ ਸਕਦਾ ਹੈ ਕਿ ਤੁਹਾਡੇ ਐਪਲੀਕੇਸ਼ਨ ਅਤੇ ਇੰਫਰਾਸਟਰਕਚਰ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਦੇ ਸਭ ਤੋਂ ਨੇੜੇ ਆਉਣ ਵਾਲੇ _AZD Starter Template_ ਨੂੰ ਲੱਭਣਾ - ਫਿਰ ਰਿਪੋਜ਼ਿਟਰੀ ਨੂੰ ਤੁਹਾਡੇ ਸਨਰੂਪ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਅਨੁਸਾਰ ਕਸਟਮਾਈਜ਼ ਕਰਨਾ।

ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਆਓ ਇਹ ਯਕੀਨੀ ਬਣਾਈਏ ਕਿ ਤੁਹਾਡੇ ਕੋਲ Azure Developer CLI ਇੰਸਟਾਲ ਹੈ।

1. VS Code ਟਰਮੀਨਲ ਖੋਲ੍ਹੋ ਅਤੇ ਇਹ ਕਮਾਂਡ ਟਾਈਪ ਕਰੋ:

      ```bash title="" linenums="0"
      azd version
      ```

1. ਤੁਹਾਨੂੰ ਕੁਝ ਇਸ ਤਰ੍ਹਾਂ ਦੇਖਣਾ ਚਾਹੀਦਾ ਹੈ!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**ਤੁਸੀਂ ਹੁਣ azd ਨਾਲ ਟੈਂਪਲੇਟ ਚੁਣਨ ਅਤੇ ਡਿਪਲੌਇ ਕਰਨ ਲਈ ਤਿਆਰ ਹੋ**

---

## 2. ਟੈਂਪਲੇਟ ਚੋਣ

Azure AI Foundry ਪਲੇਟਫਾਰਮ ਨਾਲ [ਸੁਝਾਏ ਗਏ AZD ਟੈਂਪਲੇਟਸ](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) ਦੀ ਇੱਕ ਸੈੱਟ ਹੈ ਜੋ ਪ੍ਰਸਿੱਧ ਹੱਲ ਸਨਰੂਪਾਂ ਨੂੰ ਕਵਰ ਕਰਦੇ ਹਨ ਜਿਵੇਂ ਕਿ _ਮਲਟੀ-ਏਜੰਟ ਵਰਕਫਲੋ ਆਟੋਮੇਸ਼ਨ_ ਅਤੇ _ਮਲਟੀ-ਮੋਡਲ ਸਮੱਗਰੀ ਪ੍ਰੋਸੈਸਿੰਗ_। ਤੁਸੀਂ ਇਹ ਟੈਂਪਲੇਟਸ Azure AI Foundry ਪੋਰਟਲ 'ਤੇ ਜਾ ਕੇ ਵੀ ਖੋਜ ਸਕਦੇ ਹੋ।

1. [https://ai.azure.com/templates](https://ai.azure.com/templates) 'ਤੇ ਜਾਓ
1. ਜਦੋਂ ਪੁੱਛਿਆ ਜਾਵੇ ਤਾਂ Azure AI Foundry ਪੋਰਟਲ ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ - ਤੁਹਾਨੂੰ ਕੁਝ ਇਸ ਤਰ੍ਹਾਂ ਦੇਖਣ ਨੂੰ ਮਿਲੇਗਾ।

![Pick](../../../../../translated_images/01-pick-template.60d2d5fff5ebc374d04f05f556f505a3800b2b5fb08e03153b1b878939b49da6.pa.png)

**ਬੇਸਿਕ** ਵਿਕਲਪ ਤੁਹਾਡੇ ਸਟਾਰਟਰ ਟੈਂਪਲੇਟ ਹਨ:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) ਜੋ ਇੱਕ ਬੇਸਿਕ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ _ਤੁਹਾਡੇ ਡਾਟਾ ਨਾਲ_ Azure Container Apps 'ਤੇ ਡਿਪਲੌਇ ਕਰਦਾ ਹੈ। ਇਸਦਾ ਉਪਯੋਗ ਇੱਕ ਬੇਸਿਕ AI ਚੈਟਬੋਟ ਸਨਰੂਪ ਦੀ ਪੜਚੋਲ ਕਰਨ ਲਈ ਕਰੋ।
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) ਜੋ ਇੱਕ ਮਿਆਰੀ AI Agent (Azure AI Agent Service ਨਾਲ) ਨੂੰ ਵੀ ਡਿਪਲੌਇ ਕਰਦਾ ਹੈ। ਇਸਦਾ ਉਪਯੋਗ ਟੂਲਸ ਅਤੇ ਮਾਡਲਜ਼ ਨੂੰ ਸ਼ਾਮਲ ਕਰਨ ਵਾਲੇ ਏਜੰਟਿਕ AI ਹੱਲਾਂ ਨਾਲ ਜਾਣੂ ਹੋਣ ਲਈ ਕਰੋ।

ਦੂਜੇ ਲਿੰਕ ਨੂੰ ਇੱਕ ਨਵੇਂ ਬ੍ਰਾਊਜ਼ਰ ਟੈਬ ਵਿੱਚ ਖੋਲ੍ਹੋ (ਜਾਂ ਸੰਬੰਧਿਤ ਕਾਰਡ ਲਈ `Open in GitHub` 'ਤੇ ਕਲਿਕ ਕਰੋ)। ਤੁਹਾਨੂੰ ਇਸ AZD ਟੈਂਪਲੇਟ ਲਈ ਰਿਪੋਜ਼ਿਟਰੀ ਦੇਖਣ ਨੂੰ ਮਿਲੇਗਾ। README ਦੀ ਪੜਚੋਲ ਕਰਨ ਲਈ ਇੱਕ ਮਿੰਟ ਲਓ। ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ ਕੁਝ ਇਸ ਤਰ੍ਹਾਂ ਦੇਖਦੀ ਹੈ:

![Arch](../../../../../translated_images/architecture.8cec470ec15c65c743dcc1aa383d2500be4d6a9270693b8bfeb3d8deca4a22e1.pa.png)

---

## 3. ਟੈਂਪਲੇਟ ਐਕਟੀਵੇਸ਼ਨ

ਆਓ ਇਸ ਟੈਂਪਲੇਟ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੀਏ ਅਤੇ ਇਹ ਯਕੀਨੀ ਬਣਾਈਏ ਕਿ ਇਹ ਵੈਧ ਹੈ। ਅਸੀਂ [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) ਸੈਕਸ਼ਨ ਵਿੱਚ ਦਿੱਤੀਆਂ ਹਦਾਇਤਾਂ ਦੀ ਪਾਲਣਾ ਕਰਾਂਗੇ।

1. [ਇਸ ਲਿੰਕ](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) 'ਤੇ ਕਲਿਕ ਕਰੋ - `Create codespace` ਲਈ ਡਿਫਾਲਟ ਕਾਰਵਾਈ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
1. ਇਹ ਇੱਕ ਨਵਾਂ ਬ੍ਰਾਊਜ਼ਰ ਟੈਬ ਖੋਲ੍ਹਦਾ ਹੈ - GitHub Codespaces ਸੈਸ਼ਨ ਨੂੰ ਲੋਡ ਕਰਨ ਦੇ ਪੂਰਾ ਹੋਣ ਦੀ ਉਡੀਕ ਕਰੋ
1. Codespaces ਵਿੱਚ VS Code ਟਰਮੀਨਲ ਖੋਲ੍ਹੋ - ਹੇਠਾਂ ਦਿੱਤੀ ਕਮਾਂਡ ਟਾਈਪ ਕਰੋ:

   ```bash title="" linenums="0"
   azd up
   ```

ਇਸ ਨਾਲ ਸ਼ੁਰੂ ਹੋਣ ਵਾਲੇ ਵਰਕਫਲੋ ਸਟੈਪਸ ਨੂੰ ਪੂਰਾ ਕਰੋ:

1. ਤੁਹਾਨੂੰ Azure ਵਿੱਚ ਲੌਗਇਨ ਕਰਨ ਲਈ ਕਿਹਾ ਜਾਵੇਗਾ - ਪ੍ਰਮਾਣਿਕਤਾ ਲਈ ਹਦਾਇਤਾਂ ਦੀ ਪਾਲਣਾ ਕਰੋ
1. ਆਪਣੇ ਲਈ ਇੱਕ ਵਿਲੱਖਣ ਵਾਤਾਵਰਣ ਨਾਮ ਦਰਜ ਕਰੋ - ਉਦਾਹਰਨ ਲਈ, ਮੈਂ `nitya-mshack-azd` ਵਰਤਿਆ
1. ਇਹ `.azure/` ਫੋਲਡਰ ਬਣਾਏਗਾ - ਤੁਹਾਨੂੰ env ਨਾਮ ਨਾਲ ਇੱਕ ਸਬਫੋਲਡਰ ਦੇਖਣ ਨੂੰ ਮਿਲੇਗਾ
1. ਤੁਹਾਨੂੰ ਇੱਕ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਨਾਮ ਚੁਣਨ ਲਈ ਕਿਹਾ ਜਾਵੇਗਾ - ਡਿਫਾਲਟ ਚੁਣੋ
1. ਤੁਹਾਨੂੰ ਇੱਕ ਸਥਾਨ ਲਈ ਕਿਹਾ ਜਾਵੇਗਾ - `East US 2` ਵਰਤੋ

ਹੁਣ, ਤੁਸੀਂ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਪੂਰੀ ਹੋਣ ਦੀ ਉਡੀਕ ਕਰੋ। **ਇਸ ਵਿੱਚ 10-15 ਮਿੰਟ ਲੱਗਦੇ ਹਨ**

1. ਜਦੋਂ ਹੋ ਜਾਵੇ, ਤੁਹਾਡਾ ਕੰਸੋਲ ਇਸ ਤਰ੍ਹਾਂ SUCCESS ਸੁਨੇਹਾ ਦਿਖਾਏਗਾ:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. ਤੁਹਾਡਾ Azure ਪੋਰਟਲ ਹੁਣ ਉਸ env ਨਾਮ ਨਾਲ ਇੱਕ ਪ੍ਰੋਵਿਜ਼ਨ ਕੀਤਾ ਰਿਸੋਰਸ ਗਰੁੱਪ ਰੱਖੇਗਾ:

      ![Infra](../../../../../translated_images/02-provisioned-infra.46c706b14f56e0bf36cb90ba441d16690ce10a00d42990bb9441126ceff08990.pa.png)

1. **ਤੁਸੀਂ ਹੁਣ ਡਿਪਲੌਇ ਕੀਤੇ ਇੰਫਰਾਸਟਰਕਚਰ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰਨ ਲਈ ਤਿਆਰ ਹੋ।**

---

## 4. ਟੈਂਪਲੇਟ ਵੈਰੀਫਿਕੇਸ਼ਨ

1. Azure ਪੋਰਟਲ [Resource Groups](https://portal.azure.com/#browse/resourcegroups) ਪੇਜ 'ਤੇ ਜਾਓ - ਜਦੋਂ ਪੁੱਛਿਆ ਜਾਵੇ ਤਾਂ ਲੌਗਇਨ ਕਰੋ
1. ਆਪਣੇ env ਨਾਮ ਲਈ RG 'ਤੇ ਕਲਿਕ ਕਰੋ - ਤੁਸੀਂ ਉਪਰੋਕਤ ਪੇਜ ਦੇਖਦੇ ਹੋ

      - Azure Container Apps ਰਿਸੋਰਸ 'ਤੇ ਕਲਿਕ ਕਰੋ
      - _Essentials_ ਸੈਕਸ਼ਨ (ਉਪਰਲੇ ਸੱਜੇ) ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ Url 'ਤੇ ਕਲਿਕ ਕਰੋ

1. ਤੁਹਾਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਇੱਕ ਹੋਸਟ ਕੀਤੀ ਐਪਲੀਕੇਸ਼ਨ ਫਰੰਟ-ਐਂਡ UI ਦੇਖਣ ਨੂੰ ਮਿਲੇਗਾ:

   ![App](../../../../../translated_images/03-test-application.471910da12c3038e4a3c20e98ebf080abb227e122699ef7b7a262b87af6f98c3.pa.png)

1. ਕੁਝ [ਨਮੂਨਾ ਪ੍ਰਸ਼ਨ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) ਪੁੱਛਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ

      1. ਪੁੱਛੋ: ```What is the capital of France?``` 
      1. ਪੁੱਛੋ: ```What's the best tent under $200 for two people, and what features does it include?```

1. ਤੁਹਾਨੂੰ ਹੇਠਾਂ ਦਿੱਤੇ ਜਿਵੇਂ ਜਵਾਬ ਮਿਲਣੇ ਚਾਹੀਦੇ ਹਨ। _ਪਰ ਇਹ ਕੰਮ ਕਿਵੇਂ ਕਰਦਾ ਹੈ?_ 

      ![App](../../../../../translated_images/03-test-question.521c1e863cbaddb604172e95d704407b4b6304c0e04d9130e51b7994f951b026.pa.png)

---

## 5.  ਏਜੰਟ ਵੈਰੀਫਿਕੇਸ਼ਨ

Azure Container App ਇੱਕ ਐਂਡਪੌਇੰਟ ਡਿਪਲੌਇ ਕਰਦਾ ਹੈ ਜੋ ਇਸ ਟੈਂਪਲੇਟ ਲਈ Azure AI Foundry ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਪ੍ਰੋਵਿਜ਼ਨ ਕੀਤੇ AI Agent ਨਾਲ ਜੁੜਦਾ ਹੈ। ਆਓ ਵੇਖੀਏ ਕਿ ਇਸਦਾ ਕੀ ਅਰਥ ਹੈ।

1. ਆਪਣੇ ਰਿਸੋਰਸ ਗਰੁੱਪ ਲਈ Azure ਪੋਰਟਲ _Overview_ ਪੇਜ 'ਤੇ ਵਾਪਸ ਜਾਓ

1. ਉਸ ਸੂਚੀ ਵਿੱਚ `Azure AI Foundry` ਰਿਸੋਰਸ 'ਤੇ ਕਲਿਕ ਕਰੋ

1. ਤੁਹਾਨੂੰ ਇਹ ਦੇਖਣ ਨੂੰ ਮਿਲੇਗਾ। `Go to Azure AI Foundry Portal` ਬਟਨ 'ਤੇ ਕਲਿਕ ਕਰੋ।  
   ![Foundry](../../../../../translated_images/04-view-foundry-project.fb94ca41803f28f3a7baa67099e11360380dc7f17bfb0583689cf34419b80498.pa.png)

1. ਤੁਹਾਨੂੰ ਆਪਣੇ AI ਐਪਲੀਕੇਸ਼ਨ ਲਈ Foundry Project ਪੇਜ ਦੇਖਣ ਨੂੰ ਮਿਲੇਗਾ  
   ![Project](../../../../../translated_images/05-visit-foundry-portal.d734e98135892d7e96324cebee01acfa6c339706b2d5e50ede4682beb5d431d9.pa.png)

1. `Agents` 'ਤੇ ਕਲਿਕ ਕਰੋ - ਤੁਸੀਂ ਆਪਣੇ ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਪ੍ਰੋਵਿਜ਼ਨ ਕੀਤਾ ਡਿਫਾਲਟ Agent ਦੇਖਦੇ ਹੋ  
   ![Agents](../../../../../translated_images/06-visit-agents.bccb263f77b00a0917878ae22b420c3b0df0ade50c0df8e20e6e45d49a220514.pa.png)

1. ਇਸਨੂੰ ਚੁਣੋ - ਅਤੇ ਤੁਸੀਂ Agent ਵੇਰਵੇ ਦੇਖਦੇ ਹੋ। ਹੇਠਾਂ ਦਿੱਤੀਆਂ ਚੀਜ਼ਾਂ 'ਤੇ ਧਿਆਨ ਦਿਓ:

      - Agent ਡਿਫਾਲਟ ਰੂਪ ਵਿੱਚ File Search ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ (ਹਮੇਸ਼ਾ)
      - Agent `Knowledge` ਦਰਸਾਉਂਦਾ ਹੈ ਕਿ ਇਸ ਵਿੱਚ 32 ਫਾਈਲਾਂ ਅੱਪਲੋਡ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ (ਫਾਈਲ ਖੋਜ ਲਈ)  
      ![Agents](../../../../../translated_images/07-view-agent-details.0e049f37f61eae6292faf47da2651994dab9ac9cf06c20e7c996c54dbca02245.pa.png)

1. ਖੋਜ ਲਈ `Data+indexes` ਵਿਕਲਪ ਨੂੰ ਖੋਜੋ ਅਤੇ ਵੇਰਵੇ ਲਈ ਕਲਿਕ ਕਰੋ। 

      - ਤੁਹਾਨੂੰ 32 ਡਾਟਾ ਫਾਈਲਾਂ ਅੱਪਲੋਡ ਕੀਤੀਆਂ ਦੇਖਣ ਨੂੰ ਮਿਲਣਗੀਆਂ।
      - ਇਹ `src/files` ਦੇ ਹੇਠਾਂ 12 ਗਾਹਕ ਫਾਈਲਾਂ ਅਤੇ 20 ਉਤਪਾਦ ਫਾਈਲਾਂ ਨਾਲ ਸਬੰਧਿਤ ਹੋਣਗੀਆਂ  
      ![Data](../../../../../translated_images/08-visit-data-indexes.5a4cc1686fa0d19a49625f0d4956f3b22681ae275a62c35516dabf1eb9d49a89.pa.png)

**ਤੁਸੀਂ Agent ਦੇ ਕੰਮ ਦੀ ਪੁਸ਼ਟੀ ਕੀਤੀ!** 

1. Agent ਦੇ ਜਵਾਬ ਉਹਨਾਂ ਫਾਈਲਾਂ ਵਿੱਚ ਮੌਜੂਦ ਗਿਆਨ 'ਤੇ ਅਧਾਰਿਤ ਹਨ। 
1. ਹੁਣ ਤੁਸੀਂ ਉਸ ਡਾਟਾ ਨਾਲ ਸਬੰਧਿਤ ਪ੍ਰਸ਼ਨ ਪੁੱਛ ਸਕਦੇ ਹੋ, ਅਤੇ ਅਧਾਰਿਤ ਜਵਾਬ ਪ੍ਰਾਪਤ ਕਰ ਸਕਦੇ ਹੋ।
1. ਉਦਾਹਰਨ: `customer_info_10.json` "Amanda Perez" ਦੁਆਰਾ ਕੀਤੇ 3 ਖਰੀਦਾਂ ਦਾ ਵੇਰਵਾ ਦਿੰਦਾ ਹੈ

Container App ਐਂਡਪੌਇੰਟ ਵਾਲੇ ਬ੍ਰਾਊਜ਼ਰ ਟੈਬ 'ਤੇ ਵਾਪਸ ਜਾਓ ਅਤੇ ਪੁੱਛੋ: `What products does Amanda Perez own?`। ਤੁਹਾਨੂੰ ਕੁਝ ਇਸ ਤਰ੍ਹਾਂ ਦੇਖਣ ਨੂੰ ਮਿਲੇਗਾ:

![Data](../../../../../translated_images/09-ask-in-aca.4102297fc465a4d5617af2a71501c3b7607d198df9e598f84abacc32423c17b9.pa.png)

---

## 6. Agent Playground

ਆਓ Azure AI Foundry ਦੀ ਸਮਰੱਥਾ ਲਈ ਕੁਝ ਹੋਰ ਅੰਤਰਦ੍ਰਿਸ਼ਟੀ ਬਣਾਈਏ, Agent ਨੂੰ Agents Playground ਵਿੱਚ ਅਜ਼ਮਾਉਣ ਦੁਆਰਾ। 

1. Azure AI Foundry ਵਿੱਚ `Agents` ਪੇਜ 'ਤੇ ਵਾਪਸ ਜਾਓ - ਡਿਫਾਲਟ Agent ਨੂੰ ਚੁਣੋ
1. `Try in Playground` ਵਿਕਲਪ 'ਤੇ ਕਲਿਕ ਕਰੋ - ਤੁਹਾਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਇੱਕ Playground UI ਮਿਲੇਗਾ
1. ਉਹੀ ਪ੍ਰਸ਼ਨ ਪੁੱਛੋ: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/09-ask-in-playground.a1b93794f78fa676c13e7b81dd60bc8589c742cf1069dc4589acf36ac050298d.pa.png)

ਤੁਹਾਨੂੰ ਉਹੀ (ਜਾਂ ਸਮਾਨ) ਜਵਾਬ ਮਿਲਦਾ ਹੈ - ਪਰ ਤੁਹਾਨੂੰ ਵਾਧੂ ਜਾਣਕਾਰੀ ਵੀ ਮਿਲਦੀ ਹੈ ਜੋ ਤੁਹਾਡੇ Agentic ਐਪ ਦੀ ਗੁਣਵੱਤਾ, ਲਾਗਤ, ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਨੂੰ ਸਮਝਣ ਲਈ ਵਰਤੀ ਜਾ ਸਕਦੀ ਹੈ। ਉਦਾਹਰਨ ਲਈ:

1. ਧਿਆਨ ਦਿਓ ਕਿ ਜਵਾਬ "ਅਧਾਰਿਤ" ਜਵਾਬ ਲਈ ਵਰਤੀਆਂ ਡਾਟਾ ਫਾਈਲਾਂ ਦਾ ਹਵਾਲਾ ਦਿੰਦਾ ਹੈ
1. ਕਿਸੇ ਵੀ ਫਾਈਲ ਲੇਬਲ 'ਤੇ ਹਵਰ ਕਰੋ - ਕੀ ਡਾਟਾ ਤੁਹਾਡੇ ਪ੍ਰਸ਼ਨ ਅਤੇ ਦਿਖਾਏ ਜਵਾਬ ਨਾਲ ਮੇਲ ਖਾਂਦਾ ਹੈ?

ਤੁਹਾਨੂੰ ਜਵਾਬ ਦੇ ਹੇਠਾਂ ਇੱਕ _stats_ ਪੰਗਤੀ ਵੀ ਦਿਖਾਈ ਦਿੰਦੀ ਹੈ। 

1. ਕਿਸੇ ਵੀ ਮੈਟ੍ਰਿਕ 'ਤੇ ਹਵਰ ਕਰੋ - ਉਦਾਹਰਨ ਲਈ, Safety। ਤੁਹਾਨੂੰ ਕੁਝ ਇਸ ਤਰ੍ਹਾਂ ਦੇਖਣ ਨੂੰ ਮਿਲੇਗਾ
1. ਕੀ ਅੰਕਿਤ ਰੇਟਿੰਗ ਤੁਹਾਡੇ ਜਵਾਬ ਦੀ ਸੁਰੱਖਿਆ ਪੱਧਰ ਲਈ ਤੁਹਾਡੇ ਅਨੁਭਵ ਨਾਲ ਮੇਲ ਖਾਂਦੀ ਹੈ?

      ![Data](../../../../../translated_images/10-view-run-info-meter.6cdb89a0eea5531fced8249c58037ab5fb939478145db95b840a6aab8b21d85e.pa.png)

---x

## 7. ਬਿਲਟ-ਇਨ Observability

Observability ਤੁਹਾਡੀ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਸਾਜ਼-ਸੰਭਾਲ ਕਰਨ, ਸਮਝਣ, ਅਤੇ ਇਸਦੇ ਕਾਰਜਾਂ ਨੂੰ ਅਨੁਕੂਲ ਬਣਾਉਣ ਲਈ ਡਾਟਾ ਜਨਰੇਟ ਕਰਨ ਲਈ ਸਾਜ਼-ਸੰਭਾਲ ਕਰਨ ਬਾਰੇ ਹੈ। ਇਸਦਾ ਅਹਿਸਾਸ ਕਰਨ ਲਈ:

1. `View Run Info` ਬਟਨ 'ਤੇ ਕਲਿਕ ਕਰੋ - ਤੁਹਾਨੂੰ ਇਹ ਦ੍ਰਿਸ਼ ਮਿਲੇਗਾ। ਇਹ [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) ਦੀ ਕਾਰਵਾਈ ਦਾ ਉਦਾਹਰਨ ਹੈ। _ਤੁਸੀਂ ਇਹ ਦ੍ਰਿਸ਼ Thread Logs 'ਤੇ ਕਲਿਕ ਕਰਕੇ ਵੀ ਪ੍ਰਾਪਤ ਕਰ ਸਕਦੇ ਹੋ।_

   - Agent ਦੁਆਰਾ ਸ਼ਾਮਲ ਕੀਤੇ ਰਨ ਸਟੈਪਸ ਅਤੇ ਟੂਲਸ ਲਈ ਇੱਕ ਅਹਿਸਾਸ ਪ੍ਰਾਪਤ ਕਰੋ
   - ਜਵਾਬ ਲਈ ਕੁੱਲ Token ਗਿਣਤੀ (ਵਰਤੋਂ Token ਦੀ ਵਰਤੋਂ ਦੇ ਵਿਰੁੱਧ) ਨੂੰ ਸਮਝੋ
   - ਲੈਟੈਂਸੀ ਨੂੰ ਸਮਝੋ ਅਤੇ ਕਾਰਜਨਵਾਈ ਵਿੱਚ ਸਮਾਂ ਕਿੱਥੇ ਲਗ ਰਿਹਾ ਹੈ

      ![Agent](../../../../../translated_images/10-view-run-info.b20ebd75fef6a1cc01382282300bc7d4afe4aa289de08bc97d1e097d7dc4b77d.pa.png)

1. `Metadata` ਟੈਬ 'ਤੇ ਕਲਿਕ ਕਰੋ ਤਾਂ ਜੋ ਰਨ ਲਈ ਵਾਧੂ ਗੁਣਾਂ ਦੇਖੇ ਜਾ ਸਕਣ, ਜੋ ਬਾਅਦ ਵਿੱਚ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਡਿਬੱਗ ਕਰਨ ਲਈ ਉਪਯੋਗ ਸੰਦਰਭ ਪ੍ਰਦਾਨ ਕਰ ਸਕਦੇ ਹਨ।   

      ![Agent](../../../../../translated_images/11-view-run-info-metadata.7966986122c7c2dfef2df06e56db549f922c09658b51496fac040106de75e2b9.pa.png)

1. `Evaluations` ਟੈਬ 'ਤੇ ਕਲਿਕ ਕਰੋ ਤਾਂ ਜੋ Agent ਜਵਾਬ 'ਤੇ ਕੀਤੇ ਆਟੋ-ਅਸੈਸਮੈਂਟਸ ਦੇਖੇ ਜਾ ਸਕਣ। ਇਹਨਾਂ ਵਿੱਚ ਸੁਰੱਖਿਆ ਮੁਲਾਂਕਣ (ਉਦਾਹਰਨ ਲਈ, Self-harm) ਅਤੇ Agent-ਵਿਸ਼ੇਸ਼ ਮੁਲਾਂਕਣ (ਉਦਾਹਰਨ ਲਈ, Intent resolution, Task adherence) ਸ਼ਾਮਲ ਹਨ।

      ![Agent](../../../../../translated_images/12-view-run-info-evaluations.ef25e4577d70efeb777dfadf51fed1694661fa370dd5a4e5fea4aec8de234568.pa.png)

1. ਆਖਰੀ ਪਰ ਘੱਟ ਨਹੀਂ, ਸਾਈਡਬਾਰ ਮੈਨੂ ਵਿੱਚ `Monitoring` ਟੈਬ 'ਤੇ ਕਲਿਕ ਕਰੋ।

      - ਦਿਖਾਏ ਪੇਜ ਵਿੱਚ `Resource usage` ਟੈਬ ਚੁਣੋ - ਅਤੇ ਮੈਟ੍ਰਿਕਸ ਦੇਖੋ।
      - ਲਾਗਤ (tokens) ਅਤੇ ਲੋਡ (requests) ਦੇ ਹਿਸਾਬ ਨਾਲ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਵਰਤੋਂ ਨੂੰ ਟ੍ਰੈਕ ਕਰੋ
      ```bash title="" linenums="0"
      azd env refresh
      ```

      ਇਹ ਇੱਕ ਸ਼ਕਤੀਸ਼ਾਲੀ ਤਰੀਕਾ ਹੈ ਜੋ ਦੋ ਜਾਂ ਵੱਧ ਸਥਾਨਕ ਵਿਕਾਸ ਵਾਤਾਵਰਣਾਂ ਵਿੱਚ ਵਾਤਾਵਰਣ ਚਰਾਂ ਨੂੰ _ਸਿੰਕ_ ਕਰਨ ਦੀ ਆਗਿਆ ਦਿੰਦਾ ਹੈ (ਜਿਵੇਂ ਕਿ, ਬਹੁਤ ਸਾਰੇ ਡਿਵੈਲਪਰਾਂ ਵਾਲੀ ਟੀਮ) - ਤੈਨਾਤ ਕੀਤੇ ਗਏ ਢਾਂਚੇ ਨੂੰ ਵਾਤਾਵਰਣ ਚਰਾਂ ਦੀ ਸਥਿਤੀ ਲਈ ਮੂਲ ਸੱਚਾਈ ਵਜੋਂ ਸੇਵਾ ਕਰਨ ਦੀ ਆਗਿਆ ਦਿੰਦਾ ਹੈ। ਟੀਮ ਮੈਂਬਰ ਸਿਰਫ਼ ਚਰਾਂ ਨੂੰ _ਰੀਫ੍ਰੈਸ਼_ ਕਰਦੇ ਹਨ ਤਾਂ ਜੋ ਮੁੜ ਸਿੰਕ ਵਿੱਚ ਆ ਸਕਣ।

---

## 9. ਵਧਾਈਆਂ 🏆

ਤੁਸੀਂ ਇੱਕ ਅੰਤ-ਤੱਕ ਵਰਕਫਲੋ ਪੂਰਾ ਕਰ ਲਿਆ ਹੈ ਜਿਸ ਵਿੱਚ ਤੁਸੀਂ:

- [X] AZD ਟੈਂਪਲੇਟ ਚੁਣਿਆ ਜੋ ਤੁਸੀਂ ਵਰਤਣਾ ਚਾਹੁੰਦੇ ਹੋ
- [X] ਟੈਂਪਲੇਟ ਨੂੰ GitHub Codespaces ਨਾਲ ਸ਼ੁਰੂ ਕੀਤਾ
- [X] ਟੈਂਪਲੇਟ ਨੂੰ ਤੈਨਾਤ ਕੀਤਾ ਅਤੇ ਇਸਦੀ ਸਫਲਤਾ ਦੀ ਪੁਸ਼ਟੀ ਕੀਤੀ

---

