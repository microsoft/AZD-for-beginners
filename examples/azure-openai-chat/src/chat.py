#!/usr/bin/env python3
"""
Simple Azure OpenAI Chat Application
Demonstrates Azure OpenAI integration with conversation history and cost estimates.
"""

import os
import sys
from typing import List, Dict
from config import Config

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
AZURE_OPENAI_MODEL = os.getenv("AZURE_OPENAI_MODEL", "gpt-4.1")

# Illustrative non-cached gpt-4.1 Global Standard rates (USD per 1K tokens).
# Override BOTH rates for another model/SKU; these are estimates, not billing data.

class ChatSession:
    """Manages a chat session with Azure OpenAI"""
    
    def __init__(self):
        self.config = Config()
        valid, error = self.config.validate()
        if not valid:
            raise ValueError(f"{error}. Follow the README to load the endpoint and Key Vault secret.")
        self.input_price = float(os.getenv("AZURE_OPENAI_INPUT_PRICE_PER_1K", "0.002"))
        self.output_price = float(os.getenv("AZURE_OPENAI_OUTPUT_PRICE_PER_1K", "0.008"))
        if self.input_price < 0 or self.output_price < 0:
            raise ValueError("Token price estimates must be non-negative")
        
        self.client = AzureOpenAI(
            azure_endpoint=AZURE_OPENAI_ENDPOINT,
            api_key=AZURE_OPENAI_API_KEY,
            api_version="2024-10-21",
            timeout=60.0,
            max_retries=2
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
                max_tokens=self.config.max_tokens,
                temperature=self.config.temperature
            )
            
            # Extract response
            assistant_message = response.choices[0].message.content or "[No text returned; check content filtering.]"
            
            # Add to conversation history
            self.messages.append({
                "role": "assistant",
                "content": assistant_message
            })
            
            # Calculate tokens and cost
            prompt_tokens = response.usage.prompt_tokens
            completion_tokens = response.usage.completion_tokens
            total_tokens = response.usage.total_tokens
            
            cost = (
                (prompt_tokens / 1000) * self.input_price +
                (completion_tokens / 1000) * self.output_price
            )
            
            self.total_tokens += total_tokens
            self.total_cost += cost
            
            return assistant_message, total_tokens, cost
            
        except OpenAIError as e:
            # Do not keep a failed user turn in the next request's context.
            self.messages.pop()
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

def print_banner(session):
    """Print application banner"""
    print("=" * 60)
    print("🤖 Azure OpenAI Chat Application")
    print("=" * 60)
    print(f"Model: {AZURE_OPENAI_MODEL}")
    print(f"Endpoint: {AZURE_OPENAI_ENDPOINT}")
    print(f"Max tokens: {session.config.max_tokens}")
    print("\nCommands:")
    print("  quit/exit - End session")
    print("  clear     - Clear conversation history")
    print("  stats     - Show token usage statistics")
    print("=" * 60)
    print()

def main():
    """Main chat loop"""
    # Redirected Windows output otherwise defaults to a code page without emoji.
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8")
    try:
        # Initialize session
        session = ChatSession()
        print_banner(session)
        
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
