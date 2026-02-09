# 6. Desmontar Infraestrutura

!!! tip "AO FINAL DESTE MÓDULO IRÁ CONSEGUIR"

    - [ ] Compreender a importância da limpeza de recursos e gestão de custos
    - [ ] Usar `azd down` para desprovisionar infraestrutura de forma segura
    - [ ] Recuperar serviços cognitivos eliminados de forma suave, se necessário
    - [ ] **Laboratório 6:** Limpar recursos do Azure e verificar remoção

---

## Exercícios Bónus

Antes de desmontar o projeto, reserve alguns minutos para fazer uma exploração aberta.

!!! info "Experimente Estes Prompts de Exploração"

    **Experimente o GitHub Copilot:**
    
    1. Pergunte: `Que outros templates AZD poderia experimentar para cenários multi-agente?`
    2. Pergunte: `Como posso personalizar as instruções do agente para um caso de uso em saúde?`
    3. Pergunte: `Que variáveis de ambiente controlam a otimização de custos?`
    
    **Explore o Portal Azure:**
    
    1. Reveja as métricas do Application Insights para o seu deployment
    2. Verifique a análise de custos dos recursos provisionados
    3. Explore mais uma vez o playground do agente no portal Microsoft Foundry

---

## Desprovisionar Infra

1. Desmontar a infraestrutura é tão simples como:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. A flag `--purge` garante que também elimina os recursos de Serviço Cognitivo eliminados de forma suave, libertando assim a quota detida por estes recursos. Após a conclusão verá algo assim:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Opcional) Se agora executar `azd up` novamente, vai reparar que o modelo gpt-4.1 é implantado pois a variável de ambiente foi alterada (e guardada) na pasta local `.azure`. 

      Aqui estão as implantações do modelo **antes**:

      ![Inicial](../../../../../translated_images/pt-PT/14-deploy-inicial.a364c4c33e04957d.webp)

      E aqui estão **depois**:
      ![Novo](../../../../../translated_images/pt-PT/14-deploy-novo.736645db1b130deb.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por garantir a precisão, tenha em atenção que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte oficial. Para informações críticas, recomenda-se tradução profissional feita por um humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->