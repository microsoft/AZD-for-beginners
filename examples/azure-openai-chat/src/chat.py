#!/usr/bin/env python3
"""
Simple Azure OpenAI Chat Application
Demonstrates GPT-4 integration with conversation history and cost tracking.
"""

import os
import sys
import json
from datetime import datetime
from typing import List, Dict
import time

try:
    from openai import AzureOpenAI
    from openai import OpenAIError
except ImportError:
    print("Error: Required package 'openai' not found.")
    print("Install it with: pip install openai")
    sys.exit(1)

# Configuration
AZURE_OPENAI_ENDPOINT = os.getenv("AZURE_OPENAI_ENDPOINT")
AZURE_OPENAI_API_KEY = os.getenv("AZURE_OPENAI_API_KEY")
AZURE_OPENAI_MODEL = os.getenv("AZURE_OPENAI_MODEL", "gpt-4")
AZURE_OPENAI_MAX_TOKENS = int(os.getenv("AZURE_OPENAI_MAX_TOKENS", "800"))
AZURE_OPENAI_TEMPERATURE = float(os.getenv("AZURE_OPENAI_TEMPERATURE", "0.7"))

# Token pricing (USD per 1K tokens)
PRICING = {
    "gpt-4": {"input": 0.03, "output": 0.06},
    "gpt-35-turbo": {"input": 0.0015, "output": 0.002}
}

class ChatSession:
    """Manages a chat session with Azure OpenAI"""
    
    def __init__(self):
        if not AZURE_OPENAI_ENDPOINT or not AZURE_OPENAI_API_KEY:
            raise ValueError(
                "Missing required environment variables:\n"
                "- AZURE_OPENAI_ENDPOINT\n"
                "- AZURE_OPENAI_API_KEY\n\n"
                "Run 'azd env get-values' to see deployed values."
            )
        
        self.client = AzureOpenAI(
            azure_endpoint=AZURE_OPENAI_ENDPOINT,
            api_key=AZURE_OPENAI_API_KEY,
            api_version="2024-08-01-preview"
        )
        
        self.model = AZURE_OPENAI_MODEL
        self.messages: List[Dict[str, str]] = []
        self.total_tokens = 0
        self.total_cost = 0.0
        
        # System message
        self.messages.append({
            "role": "system",
            "content": "You are a helpful AI assistant. Provide clear, concise, and accurate responses."
        })
    
    def chat(self, user_message: str) -> tuple[str, int, float]:
        """
        Send a message and get response
        Returns: (response_text, tokens_used, estimated_cost)
        """
        # Add user message
        self.messages.append({
            "role": "user",
            "content": user_message
        })
        
        try:
            # Call Azure OpenAI
            response = self.client.chat.completions.create(
                model=self.model,
                messages=self.messages,
                max_tokens=AZURE_OPENAI_MAX_TOKENS,
                temperature=AZURE_OPENAI_TEMPERATURE
            )
            
            # Extract response
            assistant_message = response.choices[0].message.content
            
            # Add to conversation history
            self.messages.append({
                "role": "assistant",
                "content": assistant_message
            })
            
            # Calculate tokens and cost
            prompt_tokens = response.usage.prompt_tokens
            completion_tokens = response.usage.completion_tokens
            total_tokens = response.usage.total_tokens
            
            model_key = "gpt-4" if "gpt-4" in self.model else "gpt-35-turbo"
            cost = (
                (prompt_tokens / 1000) * PRICING[model_key]["input"] +
                (completion_tokens / 1000) * PRICING[model_key]["output"]
            )
            
            self.total_tokens += total_tokens
            self.total_cost += cost
            
            return assistant_message, total_tokens, cost
            
        except OpenAIError as e:
            if "429" in str(e):
                return (
                    "⚠️ Rate limit exceeded. Please wait a moment and try again.",
                    0,
                    0.0
                )
            elif "404" in str(e):
                return (
                    f"⚠️ Model '{self.model}' not found. Check deployment name.",
                    0,
                    0.0
                )
            else:
                return f"⚠️ Error: {str(e)}", 0, 0.0
        
        except Exception as e:
            return f"⚠️ Unexpected error: {str(e)}", 0, 0.0
    
    def clear_history(self):
        """Clear conversation history (keeps system message)"""
        self.messages = [self.messages[0]]  # Keep system message
        print("✓ Conversation history cleared")
    
    def show_stats(self):
        """Display session statistics"""
        print(f"\n📊 Session Statistics:")
        print(f"   Total tokens used: {self.total_tokens:,}")
        print(f"   Estimated total cost: ${self.total_cost:.4f}")
        print(f"   Messages exchanged: {(len(self.messages) - 1) // 2}")

def print_banner():
    """Print application banner"""
    print("=" * 60)
    print("🤖 Azure OpenAI Chat Application")
    print("=" * 60)
    print(f"Model: {AZURE_OPENAI_MODEL}")
    print(f"Endpoint: {AZURE_OPENAI_ENDPOINT}")
    print(f"Max tokens: {AZURE_OPENAI_MAX_TOKENS}")
    print("\nCommands:")
    print("  quit/exit - End session")
    print("  clear     - Clear conversation history")
    print("  stats     - Show token usage statistics")
    print("=" * 60)
    print()

def main():
    """Main chat loop"""
    try:
        # Initialize session
        session = ChatSession()
        print_banner()
        
        # Chat loop
        while True:
            try:
                # Get user input
                user_input = input("\n\033[1;34mYou:\033[0m ").strip()
                
                if not user_input:
                    continue
                
                # Handle commands
                if user_input.lower() in ["quit", "exit"]:
                    session.show_stats()
                    print("\n👋 Goodbye!")
                    break
                
                elif user_input.lower() == "clear":
                    session.clear_history()
                    continue
                
                elif user_input.lower() == "stats":
                    session.show_stats()
                    continue
                
                # Get response
                print("\n\033[1;32mAssistant:\033[0m ", end="", flush=True)
                response, tokens, cost = session.chat(user_input)
                
                print(response)
                print(f"\n\033[90m[Tokens: {tokens} | Cost: ${cost:.4f}]\033[0m")
                
            except KeyboardInterrupt:
                print("\n\n⚠️ Interrupted. Type 'quit' to exit gracefully.")
                continue
            
            except EOFError:
                break
    
    except ValueError as e:
        print(f"\n❌ Configuration Error:\n{e}")
        sys.exit(1)
    
    except Exception as e:
        print(f"\n❌ Fatal Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
