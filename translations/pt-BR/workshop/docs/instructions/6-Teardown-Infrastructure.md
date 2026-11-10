# 6. Desmontar Infraestrutura

!!! tip "AO FINAL DESTE MÓDULO VOCÊ SERÁ CAPAZ DE"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Exercícios Bônus

Antes de desmontar o projeto, reserve alguns minutos para uma exploração aberta.

!!! info "Experimente Estes Prompts de Exploração"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Desprovisionar Infraestrutura

1. Desmontar a infraestrutura é tão fácil quanto:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Confirme o ambiente selecionado e revise os recursos a serem excluídos. Isso remove recursos do Azure e pode destruir dados. Mantenha a solicitação de confirmação para este fluxo de aprendizado. Ao concluir você verá uma saída similar a:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Verifique a exclusão no portal e confira se há recursos fora do escopo da implantação. Relatórios de custo e atualizações de cota podem atrasar. A configuração local `.azure` permanece, a menos que você a remova explicitamente.

1. `azd down --purge` solicita adicionalmente a exclusão permanente de recursos suportados como "soft-deleted". Use isso apenas quando a recuperação não for necessária e você entender as políticas de retenção/proteção contra purga. Não garante a liberação imediata da cota.

1. Não reimplante somente para verificar a limpeza. Uma futura `azd up` intencional pode recriar recursos usando as entradas locais restantes, e gerará custos novamente. Atualizações do modelo normalmente usam mudanças suportadas de provisionamento, não desmontagem.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->