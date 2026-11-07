# Exemple de microservices

L'implémentation exécutable et ses instructions se trouvent dans
**[container-app/microservices](../container-app/microservices/README.md)**.

Ce répertoire est uniquement un point de navigation. Il ne contient aucun `azure.yaml`, `infra/`, ou `src/`.
Ne lancez pas `azd up` ici.

Depuis la racine du dépôt :

```bash
cd examples/container-app/microservices
```

Ensuite, suivez le README lié pour les prérequis, le déploiement, la vérification, le développement local,
les exercices pratiques, les coûts et le nettoyage.

L'exemple contient une passerelle API Node.js et un service produit en lecture seule en Python.
Les services de commande, utilisateur, notification, base de données et messagerie sont des pistes d'extension,
et ne sont pas des implémentations incluses dans ce dépôt.

- [Précédent : API Flask simple](../../../../examples/container-app/simple-flask-api)
- [Suivant : application base de données](../../../../examples/database-app)
- [Développement IA](../../docs/chapter-02-ai-development/README.md)
- [Accueil du cours](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->