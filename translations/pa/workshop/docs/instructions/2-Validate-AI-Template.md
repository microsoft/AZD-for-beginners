# 2. Validate a Template

> `azd 1.23.12` ਦੇ ਖਿਲਾਫ ਮਾਰਚ 2026 ਵਿੱਚ ਵੈਧ ਕੀਤਾ ਗਿਆ।

!!! tip "ਤਹਿ ਮਾਡਿਊਲ ਦੇ ਅਖ਼ੀਰ ਤੱਕ ਤੁਸੀਂ ਇਹ ਸਮਰੱਥ ਹੋਵੋਗੇ"

    - [ ] AI Solution Architecture ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਨ ਲਈ
    - [ ] AZD Deployment Workflow ਨੂੰ ਸਮਝਣ ਲਈ
    - [ ] AZD ਉਪਯੋਗਤਾ ਬਾਰੇ ਮਦਦ ਲਈ GitHub Copilot ਵਰਤਣ ਲਈ
    - [ ] **Lab 2:** AI Agents ਟੈਮਪਲੇਟ ਨੂੰDeploy ਅਤੇ Validate ਕਰਨ ਲਈ

---


## 1. Introduction

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ਜਾਂ `azd` ਇੱਕ ਓਪਨ-ਸੋਰਸ ਕਮਾਂਡਲਾਈਨ ਟੂਲ ਹੈ ਜੋ Azure 'ਤੇ ਐਪਲੀਕੇਸ਼ਨਾਂ ਬਣਾਉਣ ਅਤੇ ਡਿਪਲੌਇ ਕਰਨ ਵੇਲੇ ਡਿਵੈਲਪਰ ਵਰਕਫ਼ਲੋ ਨੂੰ ਸਧਾਰਨ ਬਣਾਉਂਦਾ ਹੈ। 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) ਸਟੈਂਡਰਡਾਈਜ਼ਡ ਰਿਪੋਜ਼ਟਰੀਜ਼ ਹਨ ਜੋ ਨਮੂਨਾ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ, ਇੰਫ਼ਰਾਸਟਰੱਕਚਰ-ਐਜ਼-ਕੋਡ ਆਸੈੱਟਸ, ਅਤੇ `azd` ਸੰਰਚਨਾ ਫਾਇਲਾਂ ਇੱਕ ਸੰਗਠਿਤ ਸਮਾਧਾਨ ਆਰਕੀਟੈਕਚਰ ਲਈ ਸ਼ਾਮਿਲ ਕਰਦੀਆਂ ਹਨ। ਇੰਟ੍ਰਾਸਟਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਇੱਕ `azd provision` ਕਮਾਂਡ ਜਿਹੀ ਸੌਖੀ ਹੋ ਜਾਂਦੀ ਹੈ - ਜਦੋਂ ਕਿ `azd up` ਵਰਤ ਕੇ ਤੁਸੀਂ ਇੱਕ ਹੀ ਵਾਰੀ ਵਿੱਚ ਇੰਫ਼ਰਾਸਟਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨ ਅਤੇ ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਡਿਪਲੌਇ ਵੀ ਕਰ ਸਕਦੇ ਹੋ!

ਇਸ ਕਰਕੇ, ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਵਿਕਾਸ ਪ੍ਰਕਿਰਿਆ ਦੀ ਸ਼ੁਰੂਆਤ ਕਰਨ ਲਈ ਸਿਰਫ਼ ਢੂੰਢੋ ਉਹ AZD Starter ਟੈਮਪਲੇਟ ਜੋ ਤੁਹਾਡੀ ਐਪਲੀਕੇਸ਼ਨ ਅਤੇ ਇੰਫ਼ਰਾਸਟਰੱਕਚਰ ਦੀਆਂ ਲੋੜਾਂ ਦੇ ਨੇੜੇ ਹੋਵੇ - ਫਿਰ ਰਿਪੋਜ਼ਟਰੀ ਨੂੰ ਆਪਣੇ ਸਨੈਰੀਓ ਦੀਆਂ ਲੋੜਾਂ ਅਨੁਸਾਰ ਅਨੁਕੂਲ ਕਰੋ।

ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਆਓ ਯਕੀਨੀ ਬਣਾਈਏ ਕਿ ਤੁਹਾਡੇ ਕੋਲ Azure Developer CLI ਇੰਸਟਾਲ ਹੈ।

1. VS Code ਟਰਮੀਨਲ ਖੋਲ੍ਹੋ ਅਤੇ ਇਹ ਕਮਾਂਡ ਟਾਈਪ ਕਰੋ:

      ```bash title="" linenums="0"
      azd version
      ```

1. ਤੁਹਾਨੂੰ ਇਸ ਵਰਗਿਆ ਕੁਝ ਦਿਸੇਗਾ!

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**ਤੁਸੀਂ ਹੁਣ azd ਨਾਲ ਇੱਕ ਟੈਮਪਲੇਟ ਚੁਣਨ ਅਤੇ ਡਿਪਲੌਇ ਕਰਨ ਲਈ ਤਿਆਰ ਹੋ**

---

## 2. Template Selection

Microsoft Foundry ਪਲੇਟਫਾਰਮ ਨਾਲ [ਸਿਫਾਰਿਸ਼ ਕੀਤੀਆਂ AZD ਟੈਮਪਲੇਟਾਂ ਦਾ ਇੱਕ ਸੈੱਟ](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) ਆਉਂਦਾ ਹੈ ਜੋ ਲੋਕਪਰੀਯ ਸਮਾਧਾਨ ਸਨੈਰੀਓਜ਼ ਜਿਵੇਂ ਕਿ _multi-agent workflow automation_ ਅਤੇ _multi-modal content processing_ ਨੂੰ ਕਵਰ ਕਰਦਾ ਹੈ। ਤੁਸੀਂ ਇਹ ਟੈਮਪਲੇਟ Microsoft Foundry ਪੋਰਟਲ 'ਤੇ ਜਾ ਕੇ ਵੀ ਖੋਜ ਸਕਦੇ ਹੋ।

1. [https://ai.azure.com/templates](https://ai.azure.com/templates) 'ਤੇ ਜਾਓ
1. ਜਦੋਂ ਪ੍ਰਾਂਪਟ ਕੀਤਾ ਗਿਆ ਤਾਂ Microsoft Foundry ਪੋਰਟਲ ਵਿੱਚ ਲੌਗ ਇਨ ਕਰੋ - ਤੁਸੀਂ ਕੁਝ ਇਸ ਤਰ੍ਹਾਂ ਦਾ ਪੇਜ ਦੇਖੋਗੇ।

![Pick](../../../../../translated_images/pa/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** ਵਿਕਲਪ ਤੁਹਾਡੇ ਸ਼ੁਰੂਆਤੀ ਟੈਮਪਲੇਟ ਹਨ:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) ਜੋ ਇੱਕ ਬੁਨਿਆਦੀ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ _ਤੁਹਾਡੇ ਡੇਟਾ_ ਦੇ ਨਾਲ Azure Container Apps 'ਤੇ ਡਿਪਲੌਇ ਕਰਦਾ ਹੈ। ਇਸਨੂੰ ਇੱਕ ਬੁਨਿਆਦੀ AI ਚੈਟਬੋਟ ਸਨੈਰੀਓ ਦੀ ਪੜਤਾਲ ਲਈ ਵਰਤੋ।
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) ਜੋ Foundry Agents ਵਾਲਾ ਇੱਕ ਮਿਆਰੀ AI Agent ਵੀ ਡਿਪਲੌਇ ਕਰਦਾ ਹੈ। ਇਹ ਤੁਹਾਨੂੰ ਟੂਲਾਂ ਅਤੇ ਮਾਡਲਾਂ ਸ਼ਾਮਿਲ ਕਰਨ ਵਾਲੇ agentic AI ਸਮਾਧਾਨਾਂ ਨਾਲ ਪਰੀਚਿਤ ਕਰਵਾਉਣ ਲਈ ਹੈ।

ਦੂਜੇ ਲਿੰਕ ਨੂੰ ਨਵੇਂ ਬਰਾਊਜ਼ਰ ਟੈਬ ਵਿੱਚ ਖੋਲ੍ਹੋ (ਜਾਂ ਸਬੰਧਿਤ ਕਾਰਡ ਲਈ `Open in GitHub` 'ਤੇ ਕਲਿਕ ਕਰੋ)। ਤੁਹਾਨੂੰ ਇਸ AZD ਟੈਮਪਲੇਟ ਲਈ ਰਿਪੋਜ਼ਟਰੀ ਦਿਖੇਗਾ। README ਨੂੰ ਇੱਕ ਮਿੰਟ ਦੇ ਲਈ ਖੰਗਾਲੋ। ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ ਇਸ ਤਰ੍ਹਾਂ ਦਿੱਸਦੀ ਹੈ:

![Arch](../../../../../translated_images/pa/architecture.8cec470ec15c65c7.webp)

---

## 3. Template Activation

ਆਓ ਇਸ ਟੈਮਪਲੇਟ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੀਏ ਅਤੇ ਯਕੀਨੀ ਬਣਾਈਏ ਕਿ ਇਹ ਵੈਧ ਹੈ। ਅਸੀਂ [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) ਸੈਕਸ਼ਨ ਵਿੱਚ ਦਿੱਤੇ ਗਏ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼ਾਂ ਦਾ ਪਾਲਣ ਕਰਾਂਗੇ।

1. ਟੈਮਪਲੇਟ ਰਿਪੋਜ਼ਟਰੀ ਲਈ ਇੱਕ ਵਰਕਿੰਗ ਪਰਿਬੇਸ਼ ਚੁਣੋ:

      - **GitHub Codespaces**: ਇਸ ਲਿੰਕ 'ਤੇ ਕਲਿਕ ਕਰੋ [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) ਅਤੇ `Create codespace` ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
      - **Local clone or dev container**: `Azure-Samples/get-started-with-ai-agents` ਨੂੰ ਕਲੋਨ ਕਰੋ ਅਤੇ ਇਸਨੂੰ VS Code ਵਿੱਚ ਖੋਲ੍ਹੋ

1. VS Code ਟਰਮੀਨਲ ਤਿਆਰ ਹੋਣ ਦੀ ਉਡੀਕ ਕਰੋ, ਫਿਰ ਹੇਠਾਂ ਦਿੱਤੀ ਕਮਾਂਡ ਟਾਈਪ ਕਰੋ:

   ```bash title="" linenums="0"
   azd up
   ```

ਉਹ ਵਰਕਫਲੋ ਕਦਮ ਪੂਰੇ ਕਰੋ ਜੋ ਇਹ ਟ੍ਰਿਗਰ ਕਰੇਗਾ:

1. ਤੁਹਾਨੂੰ Azure ਵਿੱਚ ਲੌਗਇਨ ਕਰਨ ਲਈ ਪ੍ਰਾਂਪਟ ਕੀਤਾ ਜਾਵੇਗਾ - ਪ੍ਰਮਾਣੀਕਰਨ ਲਈ ਦਿੱਤੀਆਂ ਹਦਾਇਤਾਂ ਦੀ ਪਾਲਨਾ ਕਰੋ
1. ਆਪਣੇ ਲਈ ਇੱਕ ਵਿਲੱਖਣ environment ਨਾਮ ਦਰਜ ਕਰੋ - ਉਦਾਹਰਣ ਲਈ, ਮੈਂ `nitya-mshack-azd` ਵਰਤਿਆ
1. ਇਹ `.azure/` ਫੋਲਡਰ ਬਣਾਏਗਾ - ਤੁਸੀਂ env ਨਾਮ ਵਾਲਾ ਇੱਕ ਸਬਫੋਲਡਰ ਵੇਖੋਗੇ
1. ਤੁਹਾਨੂੰ ਇੱਕ subscription ਨਾਮ ਚੁਣਨ ਲਈ ਪ੍ਰਾਂਪਟ ਕੀਤਾ ਜਾਵੇਗਾ - ਡਿਫਾਲਟ ਚੁਣੋ
1. ਤੁਹਾਨੂੰ ਇੱਕ location ਲਈ ਪ੍ਰਾਂਪਟ ਕੀਤਾ ਜਾਵੇਗਾ - `East US 2` ਵਰਤੋ

ਹੁਣ, ਤੁਸੀਂ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਪੂਰੀ ਹੋਣ ਦੀ ਉਡੀਕ ਕਰੋ। ਇਹ 10-15 ਮਿੰਟ ਲੱਗਦੇ ਹਨ

1. ਜਦੋਂ ਹੋ ਜਾਵੇ, ਤੁਹਾਡੇ ਕੰਸੋਲ ਵਿੱਚ SUCCESS ਸੁਨੇਹਾ ਇਸ ਤਰ੍ਹਾਂ ਦਿਖਾਈ ਦੇਵੇਗਾ:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. ਤੁਹਾਡੇ Azure Portal ਵਿੱਚ ਹੁਣ ਉਸ env ਨਾਮ ਨਾਲ ਇੱਕ ਪ੍ਰੋਵਿਜ਼ਨ ਕੀਤਾ ਹੋਇਆ Resource Group ਹੋਵੇਗਾ:

      ![Infra](../../../../../translated_images/pa/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **ਤੁਸੀਂ ਹੁਣ ਡਿਪਲੌਇ ਕੀਤੇ ਇੰਫ਼ਰਾਸਟਰੱਕਚਰ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਵੈਧ ਕਰਨ ਲਈ ਤਿਆਰ ਹੋ**।

---

## 4. Template Validation

1. Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) ਪੇਜ 'ਤੇ ਜਾਓ - ਜਦੋਂ ਪ੍ਰਾਂਪਟ ਕੀਤਾ ਜਾਵੇ ਲੌਗ ਇਨ ਕਰੋ
1. ਆਪਣੇ environment ਨਾਮ ਵਾਲੇ RG 'ਤੇ ਕਲਿਕ ਕਰੋ - ਤੁਸੀਂ ਉੱਪਰ ਦਿੱਤਾ ਪੇਜ ਵੇਖੋਗੇ

      - Azure Container Apps resource 'ਤੇ ਕਲਿਕ ਕਰੋ
      - _Essentials_ ਸੈਕਸ਼ਨ (ਟੋਪ ਰਾਈਟ) ਵਿੱਚ Application Url 'ਤੇ ਕਲਿਕ ਕਰੋ

1. ਤੁਹਾਨੂੰ ਇੱਕ ਹੋਸਟ ਕੀਤੀ ਐਪਲੀਕੇਸ਼ਨ ਫ੍ਰੰਟ-ਐਂਡ UI ਇਹ ਤਰ੍ਹਾਂ ਦੇਖਣ ਨੂੰ ਮਿਲੇਗੀ:

   ![App](../../../../../translated_images/pa/03-test-application.471910da12c3038e.webp)

1. ਕੁਝ [ਨਮੂਨਾ ਸਵਾਲ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) ਪੁੱਛ ਕੇ ਦੇਖੋ

      1. ਪੁੱਛੋ: ```What is the capital of France?``` 
      1. ਪੁੱਛੋ: ```What's the best tent under $200 for two people, and what features does it include?```

1. ਤੁਹਾਨੂੰ ਹੇਠਾਂ ਦਿੱਤੇ ਗਏ ਵਾਂਗ ਜਵਾਬ ਮਿਲਣੇ ਚਾਹੀਦੇ ਹਨ। _ਪਰ ਇਹ ਕਿਵੇਂ ਕੰਮ ਕਰਦਾ ਹੈ?_ 

      ![App](../../../../../translated_images/pa/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Agent Validation

Azure Container App ਇੱਕ ਐਂਡਪੋਇੰਟ ਡਿਪਲੌਇ ਕਰਦਾ ਹੈ ਜੋ ਇਸ ਟੈਮਪਲੇਟ ਲਈ Microsoft Foundry ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਪ੍ਰੋਵਿਜ਼ਨ ਕੀਤੇ AI Agent ਨਾਲ ਜੁੜਦਾ ਹੈ। ਆਓ ਦੇਖੀਏ ਇਹ ਕੀ ਮਤਲਬ ਹੈ।

1. ਆਪਣੇ Resource Group ਲਈ Azure Portal _Overview_ ਪੇਜ 'ਤੇ ਵਾਪਸ ਜਾਓ

1. ਉਸ ਸੂਚੀ ਵਿੱਚ `Microsoft Foundry` resource 'ਤੇ ਕਲਿਕ ਕਰੋ

1. ਤੁਹਾਨੂੰ ਇਹ ਦਿਖਾਈ ਦੇਣਾ ਚਾਹੀਦਾ ਹੈ। `Go to Microsoft Foundry Portal` ਬਟਨ 'ਤੇ ਕਲਿਕ ਕਰੋ। 
   ![Foundry](../../../../../translated_images/pa/04-view-foundry-project.fb94ca41803f28f3.webp)

1. ਤੁਹਾਨੂੰ ਆਪਣੀ AI ਐਪ ਲਈ Foundry Project ਪੇਜ ਦਿਖੇਗੀ
   ![Project](../../../../../translated_images/pa/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents` 'ਤੇ ਕਲਿਕ ਕਰੋ - ਤੁਸੀਂ ਆਪਣੇ ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਡਿਫਾਲਟ Agent ਨੂੰ ਦੇਖੋਗੇ
   ![Agents](../../../../../translated_images/pa/06-visit-agents.bccb263f77b00a09.webp)

1. ਇਸਨੂੰ ਚੁਣੋ - ਅਤੇ ਤੁਸੀਂ Agent ਵੇਰਵੇ ਵੇਖੋਗੇ। ਹੇਠ ਲਿਖੇ ਨੋਟ ਕਰੋ:

      - ਇਹ agent ਡਿਫਾਲਟ ਰੂਪ ਵਿੱਚ File Search ਵਰਤਦਾ ਹੈ (ਹਮੇਸ਼ਾਂ)
      - agent ਦੀ `Knowledge` ਦਰਸਾਉਂਦੀ ਹੈ ਕਿ ਇਸ ਵਿੱਚ 32 ਫਾਇਲਾਂ ਅਪਲੋਡ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ (file search ਲਈ)
      ![Agents](../../../../../translated_images/pa/07-view-agent-details.0e049f37f61eae62.webp)

1. ਲੇਫਟ ਮੀਨੂ ਵਿੱਚ `Data+indexes` ਵਿਕਲਪ ਦੀ ਖੋਜ ਕਰੋ ਅਤੇ ਵੇਰਿਆਂ ਲਈ ਕਲਿਕ ਕਰੋ। 

      - ਤੁਸੀਂ ਗਿਆਨ ਲਈ ਅਪਲੋਡ ਕੀਤੀਆਂ 32 ਡਾਟਾ ਫਾਇਲਾਂ ਦੇਖੋਂਗੇ।
      - ਇਹਨਾਂ ਦੀ ਤੁਲਨਾ `src/files` ਅਧੀਨ 12 customer ਫਾਇਲਾਂ ਅਤੇ 20 product ਫਾਇਲਾਂ ਨਾਲ ਹੋਵੇਗੀ
      ![Data](../../../../../translated_images/pa/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**ਤੁਸੀਂ Agent ਓਪਰੇਸ਼ਨ ਨੂੰ ਵੈਧ ਕਰ ਲਿਆ ਹੈ!** 

1. agent ਦੇ ਜਵਾਬ ਉਹਨਾਂ ਫਾਇਲਾਂ ਵਿੱਚ ਮੌਜੂਦ ਗਿਆਨ ਤੇ ਆਧਾਰਿਤ ਹਨ। 
1. ਹੁਣ ਤੁਸੀਂ ਉਸ ਡੇਟਾ ਨਾਲ ਸੰਬੰਧਿਤ ਸਵਾਲ ਪੁੱਛ ਸਕਦੇ ਹੋ, ਅਤੇ ਮੂਲਧਾਰਿਤ ਜਵਾਬ ਪ੍ਰਾਪਤ ਕਰ ਸਕਦੇ ਹੋ।
1. ਉਦਾਹਰਣ: `customer_info_10.json` "Amanda Perez" ਦੁਆਰਾ ਕੀਤੀਆਂ 3 ਖਰੀਦਾਂ ਦੀ ਵਿਵਰਣ ਦਿੰਦੀ ਹੈ

Container App ਐਂਡਪੋਇੰਟ ਵਾਲੇ ਬਰਾਊਜ਼ਰ ਟੈਬ 'ਤੇ ਵਾਪਸ ਜਾ ਕੇ ਪੁੱਛੋ: `What products does Amanda Perez own?`. ਤੁਹਾਨੂੰ ਕੁਝ ਇਸ ਤਰ੍ਹਾਂ ਦਿਖਾਈ ਦੇਣਾ ਚਾਹੀਦਾ ਹੈ:

![Data](../../../../../translated_images/pa/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Microsoft Foundry ਦੀਆਂ ਸਮਰੱਥਾਵਾਂ ਲਈ ਕੁਝ ਹੋਰ ਸਮਝ ਬਣਾਉਣ ਲਈ, Agent ਨੂੰ Agents Playground ਵਿੱਚ ਇਕ ਵਾਰੀ ਚਲਾਉਂਦੇ ਹਾਂ। 

1. Microsoft Foundry ਵਿੱਚ `Agents` ਪੇਜ 'ਤੇ ਵਾਪਸ ਜਾਓ - ਡਿਫਾਲਟ agent ਚੁਣੋ
1. `Try in Playground` ਚੋਣ 'ਤੇ ਕਲਿਕ ਕਰੋ - ਤੁਹਾਨੂੰ Playground UI ਇਸ ਤਰ੍ਹਾਂ ਮਿਲੇਗਾ
1. ਇੱਕੋ ਜਿਹਾ ਸਵਾਲ ਪੁੱਛੋ: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/pa/09-ask-in-playground.a1b93794f78fa676.webp)

ਤੁਹਾਨੂੰ ਉਹੀ (ਜਾਂ ਮਿਲਦਾ-ਜੁਲਦਾ) ਜਵਾਬ ਮਿਲੇਗਾ - ਪਰ ਤੁਹਾਨੂੰ ਵਾਧੂ ਜਾਣਕਾਰੀ ਵੀ ਮਿਲਦੀ ਹੈ ਜੋ ਤੁਹਾਨੂੰ ਆਪਣੇ agentic ਐਪ ਦੀ ਗੁਣਵੱਤਾ, ਲਾਗਤ, ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਸਮਝਣ ਵਿੱਚ ਮਦਦ ਕਰਦੀ ਹੈ। ਉਦਾਹਰਣ ਲਈ:

1. ਨੋਟ ਕਰੋ ਕਿ ਜਵਾਬ ਉਹਨਾਂ ਡਾਟਾ ਫਾਇਲਾਂ ਦਾ ਹਵਾਲਾ ਦਿੰਦਾ ਹੈ ਜੋ ਜਵਾਬ ਨੂੰ "ground" ਕਰਨ ਲਈ ਵਰਤੀਆਂ ਗਈਆਂ
1. ਕਿਸੇ ਵੀ ਫਾਇਲ ਲੇਬਲ 'ਤੇ ਹੋਵਰ ਕਰੋ - ਕੀ ਡੇਟਾ ਤੁਹਾਡੇ ਪ੍ਰਸ਼ਨ ਅਤੇ ਦਿਖਾਏ ਗਏ ਜਵਾਬ ਨਾਲ ਮੈਚ ਕਰਦਾ ਹੈ?

ਤੁਸੀਂ জਵਾਬ ਹੇਠਾਂ ਇੱਕ _stats_ ਰੋ ਨੂੰ ਵੀ ਵੇਖੋਗੇ। 

1. ਕਿਸੇ ਵੀ ਮੈਟ੍ਰਿਕ 'ਤੇ ਹੋਵਰ ਕਰੋ - ਉਦਾਹਰਣ ਲਈ, Safety. ਤੁਹਾਨੂੰ ਕੁਝ ਇਹੋ ਜਿਹਾ ਦਿਖੇਗਾ
1. ਕੀ ਅੰਕਿਤ ਕੀਤੀ ਰੇਟਿੰਗ ਤੁਹਾਡੇ ਜਵਾਬ ਦੀ ਸੁਰੱਖਿਆ ਦੀ ਭਾਵਨਾ ਨਾਲ ਮਿਲਦੀ ਹੈ?

      ![Data](../../../../../translated_images/pa/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Built-in Observability

Observability ਦਾ ਮਤਲਬ ਹੈ ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਇੰਸਟ੍ਰੂਮੈਂਟ ਕਰਨਾ ਕਿ ਉਹ ਡੇਟਾ ਜਨਰੇਟ ਕਰੇ ਜੋ ਇਸਦੇ ਓਪਰੇਸ਼ਨ ਨੂੰ ਸਮਝਣ, ਡੀਬੱਗ ਕਰਨ, ਅਤੇ ਅਪਟੀਮਾਈਜ਼ ਕਰਨ ਲਈ ਵਰਤੀ ਜਾ ਸਕੇ। ਇਸਦਾ ਇੱਕ ਅਹਿਸਾਸ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ:

1. `View Run Info` ਬਟਨ 'ਤੇ ਕਲਿਕ ਕਰੋ - ਤੁਹਾਨੂੰ ਇਹ ਵਿਊ ਮਿਲੇਗਾ। ਇਹ [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) ਦਾ ਇੱਕ ਉਦਾਹਰਨ ਹੈ। _ਤੁਸੀਂ ਇਸ ਵਿਊ ਨੂੰ Thread Logs 'ਤੇ ਕਲਿਕ ਕਰਕੇ ਵੀ ਪ੍ਰਾਪਤ ਕਰ ਸਕਦੇ ਹੋ_।

   - ਰਨ ਕਦਮਾਂ ਅਤੇ agent ਦੁਆਰਾ ਜੁੜੇ ਟੂਲਾਂ ਦਾ ਅਹਿਸਾਸ ਕਰੋ
   - ਜਵਾਬ ਲਈ ਕੁੱਲ Token ਗਿਣਤੀ (ਅਤੇ output tokens ਦੀ ਵਰਤੋਂ) ਨੂੰ ਸਮਝੋ
   - ਲੇਟੈਂਸੀ ਅਤੇ ਕਾਰਜਨਿਰਵਾਹ ਵਿੱਚ ਸਮਾਂ ਕਿੱਥੇ ਗੁਜ਼ਰ ਰਿਹਾ ਹੈ ਉਹ ਸਮਝੋ

      ![Agent](../../../../../translated_images/pa/10-view-run-info.b20ebd75fef6a1cc.webp)

1. `Metadata` ਟੈਬ 'ਤੇ ਕਲਿੱਕ ਕਰੋ ਤਾਂ ਜੋ ਰਨ ਲਈ ਵਾਧੂ ਗੁਣਾਂਕ ਵੇਖ ਸਕੋ, ਜੋ ਬਾਅਦ ਵਿੱਚ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਡੀਬੱਗ ਕਰਨ ਲਈ ਮਦਦਗਾਰ ਸੰਦਰਭ ਦੇ ਸਕਦੇ ਹਨ।   

      ![Agent](../../../../../translated_images/pa/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` ਟੈਬ 'ਤੇ ਕਲਿੱਕ ਕਰੋ ਤਾਂ ਜੋ agent ਦੇ ਜਵਾਬ 'ਤੇ ਕੀਤੀਆਂ ਆਟੋ-ਮੁਲਾਂਕਣ ਨੂੰ ਦੇਖ ਸਕੋ। ਇਹਨਾਂ ਵਿੱਚ ਸੁਰੱਖਿਆ ਮੁਲਾਂਕਣ (ਉਦਾਹਰਣ ਲਈ, Self-harm) ਅਤੇ agent-ਨਿਰਧਾਰਤ ਮੁਲਾਂਕਣ (ਉਦਾਹਰਣ ਲਈ, Intent resolution, Task adherence) ਸ਼ਾਮਿਲ ਹਨ।

      ![Agent](../../../../../translated_images/pa/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. ਆਖਿਰਕਾਰ, ਸਾਈਡਬਾਰ ਮੀਨੂ ਵਿੱਚ `Monitoring` ਟੈਬ 'ਤੇ ਕਲਿੱਕ ਕਰੋ।

      - ਪ੍ਰਦਰਸ਼ਿਤ ਪੇਜ ਵਿੱਚ `Resource usage` ਟੈਬ ਚੁਣੋ - ਅਤੇ ਮੈਟ੍ਰਿਕਸ ਵੇਖੋ।
      - ਲਾਗਤਾਂ (tokens) ਅਤੇ ਲੋਡ (requests) ਦੇ ਸੰਦਰਭ ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਵਰਤੋਂ ਟ੍ਰੈਕ ਕਰੋ।
      - ਪਹਿਲੇ ਬਾਈਟ (ਇੰਪੁੱਟ ਪ੍ਰੋਸੈਸਿੰਗ) ਅਤੇ ਆਖਰੀ ਬਾਈਟ (ਆਉਟਪੁੱਟ) ਲਈ ਐਪਲੀਕੇਸ਼ਨ ਲੇਟੈਂਸੀ ਟ੍ਰੈਕ ਕਰੋ।

      ![Agent](../../../../../translated_images/pa/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Environment Variables

ਅਜੇ ਤੱਕ, ਅਸੀਂ ਬਰਾਊਜ਼ਰ ਵਿੱਚ ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਪ੍ਰਕਿਰਿਆ ਚਲਾਈ ਹੈ - ਅਤੇ ਵੈਧ ਕੀਤਾ ਹੈ ਕਿ ਸਾਡਾ ਇੰਫ਼ਰਾਸਟਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨ ਹੋ ਗਿਆ ਹੈ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਚਲ ਰਹੀ ਹੈ। ਪਰ ਕੋਡ-ਪਹਿਲਾਂ (code-first) ਤਰੀਕੇ ਨਾਲ ਕੰਮ ਕਰਨ ਲਈ, ਸਾਨੂੰ ਆਪਣੇ ਲੋਕਲ ਡਿਵੈਲਪਮੈਂਟ ਪਰਿਬੇਸ਼ ਨੂੰ ਉਹਨਾਂ ਸੰਬੰਧਿਤ ਵੈਰੀਏਬਲਾਂ ਨਾਲ ਸੰਰਚਿਤ ਕਰਨ ਦੀ ਲੋੜ ਹੈ ਜੋ ਇਨ੍ਹਾਂ ਰਿਸੋਰਸز ਨਾਲ ਕੰਮ ਕਰਨ ਲਈ ਲਾਜ਼ਮੀ ਹਨ। `azd` ਇਸਨੂੰ ਆਸਾਨ ਬਣਾਉਂਦਾ ਹੈ।

1. Azure Developer CLI [enviornment variables ਵਰਤਦਾ ਹੈ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) ਤਾਂ ਜੋ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟਸ ਲਈ ਸੰਰਚਨਾ ਸੈਟਿੰਗਜ਼ ਸਟੋਰ ਅਤੇ ਪ੍ਰਬੰਧ ਕੀਤੀਆਂ ਜਾ ਸਕਣ।

1. Environment variables `.azure/<env-name>/.env` ਵਿੱਚ ਸਟੋਰ ਕੀਤੇ ਜਾਂਦੇ ਹਨ - ਇਹਨਾਂ ਨੂੰ ਉਸ `env-name` ਵਾਤਾਵਰਨ ਤੱਕ ਸੀਮਿਤ ਕਰਦਾ ਹੈ ਜੋ ਡਿਪਲੌਇਮੈਂਟ ਦੌਰਾਨ ਵਰਤਿਆ ਗਿਆ ਸੀ ਅਤੇ ਇੱਕੋ ਰਿਪੋ ਵਿੱਚ ਵੱਖ-ਵੱਖ ਡਿਪਲੌਇਮੈਂਟ ਟਾਰਗੇਟਾਂ ਵਿਚਕਾਰ ਵਾਤਾਵਰਨਾਂ ਨੂੰ ਅਲੱਗ ਰੱਖਣ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ।

1. Environment variables ਨੂੰ `azd` ਕਮਾਂਡ ਦੁਆਰਾ ਆਪਣੇ ਕਿਸੇ ਵਿਸ਼ੇਸ਼ ਕਮਾਂਡ (ਉਦਾਹਰਣ ਲਈ, `azd up`) ਚਲਾਉਂਦੇ ਸਮੇਂ ਆਟੋਮੈਟਿਕ ਤੌਰ 'ਤੇ ਲੋਡ ਕੀਤਾ ਜਾਂਦਾ ਹੈ। ਨੋਟ ਕਰੋ ਕਿ `azd` ਆਟੋਮੈਟਿਕ ਤੌਰ 'ਤੇ _OS-ਸਤਹ_ ਦੇ environment variables (ਉਦਾਹਰਣ ਲਈ, shell ਵਿੱਚ ਸੈਟ ਕੀਤੀਆਂ) ਨੂੰ ਨਹੀਂ ਪੜ੍ਹਦਾ - ਇਸ ਦੀ ਥਾਂ `azd set env` ਅਤੇ `azd get env` ਵਰਤ ਕੇ ਸਕ੍ਰਿਪਟਾਂ ਵਿੱਚ ਜਾਣਕਾਰੀ ਟ੍ਰਾਂਸਫਰ ਕਰੋ।


ਆਓ ਕੁਝ ਕਮਾਂਡਾਂ ਅਜ਼ਮਾਈਏ:

1. ਇਸ ਵਾਤਾਵਰਨ ਵਿੱਚ `azd` ਲਈ ਸੈੱਟ ਕੀਤੀਆਂ ਸਾਰੀਆਂ environment variables ਪ੍ਰਾਪਤ ਕਰੋ:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      ਤੁਹਾਨੂੰ ਕੁਝ ਇਸ ਤਰ੍ਹਾਂ ਦਿਸਦਾ ਹੈ:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. ਇੱਕ ਨਿਰਦਿਸ਼ਟ ਮੁੱਲ ਪ੍ਰਾਪਤ ਕਰੋ - ਉਦਾਹਰਣ ਲਈ, ਮੈਂ ਵੇਖਣਾ ਚਾਹੁੰਦਾ ਹਾਂ ਕਿ `AZURE_AI_AGENT_MODEL_NAME` ਦਾ ਮੁੱਲ ਸੈੱਟ ਕੀਤਾ ਗਿਆ ਹੈ ਜਾਂ ਨਹੀਂ

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      ਤੁਹਾਨੂੰ ਕੁਝ ਇਸ ਤਰ੍ਹਾਂ ਦਿਸੇਗਾ - ਇਹ ਡਿਫਾਲਟ ਰੂਪ ਵਿੱਚ ਸੈੱਟ ਨਹੀਂ ਸੀ!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd` ਲਈ ਇੱਕ ਨਵਾਂ environment variable ਸੈੱਟ ਕਰੋ। ਇਥੇ, ਅਸੀਂ agent ਮਾਡਲ ਨਾਮ ਨੂੰ ਅਪਡੇਟ ਕਰਦੇ ਹਾਂ। _ਨੋਟ: ਕੀਤੇ ਗਏ ਕੋਈ ਵੀ ਬਦਲਾਅ ਤੁਰੰਤ `.azure/<env-name>/.env` ਫਾਇਲ ਵਿੱਚ ਦਰਸਾਏ ਜਾਣਗੇ।_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      ਹੁਣ, ਸਾਨੂੰ ਮੁੱਲ ਸੈੱਟ ਹੋਇਆ ਮਿਲਣਾ ਚਾਹੀਦਾ ਹੈ:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. ਨੋਟ ਕਰੋ ਕਿ ਕੁਝ ਰਿਸੋਰਸ ਪਰਸਿਸਟੈਂਟ ਹੁੰਦੇ ਹਨ (ਉਦਾਹਰਣ ਲਈ, ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ) ਅਤੇ ਉਨ੍ਹਾਂ ਲਈ ਮੁੜਡਿਪਲੌਇ ਕਰਨ ਲਈ ਸਿਰਫ `azd up` ਦੀ ਲੋੜ ਨਹੀਂ ਪਵੇਗੀ। ਆਓ ਅਸਲ ਡਿਪਲੌਇਮੈਂਟ ਨੂੰ ਤੋੜ ਕੇ ਬਦਲੇ ਹੋਏ env vars ਨਾਲ ਮੁੜਡਿਪਲੌਇ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੀਏ।

1. **Refresh** ਜੇ ਤੁਸੀਂ ਪਹਿਲਾਂ ਇੱਕ azd ਟੈਮਪਲੇਟ ਵਰਤ ਕੇ ਇੰਫ਼ਰਾਸਟਰੱਕਚਰ ਡਿਪਲੌਇ ਕੀਤਾ ਸੀ - ਤਾਂ ਤੁਸੀਂ ਇਸ ਕਮਾਂਡ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਆਪਣੇ ਲੋਕਲ environment variables ਦੀ ਸਥਿਤੀ ਨੂੰ ਆਪਣੇ Azure ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਮੌਜੂਦਾ ਸਥਿਤੀ ਦੇ ਆਧਾਰ 'ਤੇ _refresh_ ਕਰ ਸਕਦੇ ਹੋ:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      ਇਹ ਇੱਕ ਸ਼ਕਤੀਸ਼ਾਲੀ ਤਰੀਕਾ ਹੈ ਦੋ ਜਾਂ ਵੱਧ ਲੋਕਲ ਡਿਵੈਲਪਮੈਂਟ ਇਨਵਾਇਰਨਮੈਂਟਾਂ ਵਿਚ ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲਾਂ ਨੂੰ _sync_ ਕਰਨ ਦਾ (ਉਦਾਹਰਨ ਲਈ, ਇਕ ਟੀਮ ਜਿਸ ਵਿੱਚ ਕਈ ਡਿਵੈਲਪਰ ਹਨ) - allowing the deployed infrastructure to serve as the ground truth for env variable state. Team members simply _refresh_ variables to get back in sync.

---

## 9. ਵਧਾਈਆਂ 🏆

ਤੁਸੀਂ ਹੁਣੇ ਇੱਕ ਸ਼ੁਰੂ ਤੋਂ ਅੰਤ ਤੱਕ ਦਾ ਵਰਕਫਲੋ ਪੂਰਾ ਕੀਤਾ ਹੈ ਜਿਸ ਵਿੱਚ ਤੁਸੀਂ:

- [X] ਉਸ AZD ਟੇਮਪਲੇਟ ਨੂੰ ਚੁਣਿਆ ਜੋ ਤੁਸੀਂ ਵਰਤਣਾ ਚਾਹੁੰਦੇ ਹੋ
- [X] ਟੇਮਪਲੇਟ ਨੂੰ ਇੱਕ ਸਮਰਥਿਤ ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਣ ਵਿੱਚ ਖੋਲ੍ਹਿਆ
- [X] ਟੇਮਪਲੇਟ ਨੂੰ ਤੈਨਾਤ ਕੀਤਾ ਅਤੇ ਪ੍ਰਮਾਣਿਤ ਕੀਤਾ ਕਿ ਇਹ ਕੰਮ ਕਰਦਾ ਹੈ

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਤੀਫ਼ਾ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਹੀਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਣ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਭਰਮਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->