"""
Configuration loader for Azure OpenAI Chat Application
"""

import os
from typing import Optional

class Config:
    """Application configuration"""
    
    def __init__(self):
        self.openai_endpoint = os.getenv("AZURE_OPENAI_ENDPOINT")
        self.openai_api_key = os.getenv("AZURE_OPENAI_API_KEY")
        self.openai_model = os.getenv("AZURE_OPENAI_MODEL", "gpt-4")
        self.max_tokens = int(os.getenv("AZURE_OPENAI_MAX_TOKENS", "800"))
        self.temperature = float(os.getenv("AZURE_OPENAI_TEMPERATURE", "0.7"))
    
    def validate(self) -> tuple[bool, Optional[str]]:
        """Validate configuration"""
        if not self.openai_endpoint:
            return False, "AZURE_OPENAI_ENDPOINT not set"
        
        if not self.openai_api_key:
            return False, "AZURE_OPENAI_API_KEY not set"
        
        if not self.openai_endpoint.startswith("https://"):
            return False, "AZURE_OPENAI_ENDPOINT must start with https://"
        
        if self.max_tokens < 1 or self.max_tokens > 4096:
            return False, "max_tokens must be between 1 and 4096"
        
        if self.temperature < 0 or self.temperature > 2:
            return False, "temperature must be between 0 and 2"
        
        return True, None
    
    def __repr__(self):
        return (
            f"Config(endpoint={self.openai_endpoint}, "
            f"model={self.openai_model}, "
            f"max_tokens={self.max_tokens})"
        )
