import pandas as pd
import os
import gensim # MUST INSTALL GENSIM 3.8.0
import gensim.corpora as corpora
import numpy as np
import string
import re
import spacy
import nltk
import matplotlib.pyplot as plt
from nltk.corpus.reader.plaintext import PlaintextCorpusReader
from numpy import genfromtxt
from gensim.corpora import Dictionary
from gensim.models.coherencemodel import CoherenceModel
from nltk.tokenize import word_tokenize
from nltk.stem import WordNetLemmatizer
from gensim.models.wrappers import LdaMallet
spacy.cli.download("en_core_web_sm")
nlp = spacy.load("en_core_web_sm")
os.environ.update({'MALLET_HOME':'C:/Users/diego/Downloads/mallet-2.0.8/mallet-2.0.8/'}) 
os.environ.update({'JAVA_HOME' : 'C:/Program Files/Java/jre-1.8'})
nltk.download('punkt')
nltk.download('stopwords')
nltk.download('averaged_perceptron_tagger')
nltk.download('wordnet')
#import text from R file
corpus_path = r'C:\Users\diego\OneDrive\Desktop\Gensim\jtexts\text_files'

corpus = PlaintextCorpusReader(corpus_path, '.*')

fileids = corpus.fileids()

print("complete read corpus")


def clean_text(text):
    # Remove punctuation
    translator = str.maketrans('', '', string.punctuation)
    text_without_punct = text.translate(translator)
    
    # Remove multiple white spaces
    text_without_whitespace = re.sub(r'\s+', ' ', text_without_punct).strip()
    
    return text_without_whitespace

cleaned_dir = r'C:\Users\diego\OneDrive\Desktop\Gensim\cleaned_texts'
for fileid in fileids:
    # Clean each document
    cleaned_text = clean_text(corpus.raw(fileid))
    
    # Write cleaned text to a new file in the cleaned directory
    with open(cleaned_dir + '/' + fileid, 'w', encoding='utf-8') as f:
        f.write(cleaned_text)

# Create a new PlaintextCorpusReader for the cleaned directory
corpus_cleaned = PlaintextCorpusReader(cleaned_dir, '.*\.txt')

print("complete clean corpus")

# Tokenization and Lowercasing
tokens = [word.lower() for word in word_tokenize(corpus_cleaned.raw())]

#remove stopwords 
#stop_words = set(stopwords.words('english'))
#tokens = [word for word in tokens if word.isalnum() and word not in stop_words]

lemmatizer = WordNetLemmatizer()

def lemmatization(texts, allowed_postags=['NOUN', 'ADJ', 'VERB', 'ADV']):
    """https://spacy.io/api/annotation"""
    texts_out = []
    for sent in texts:
        doc = nlp(" ".join(sent)) 
        texts_out.append([token.lemma_ for token in doc if token.pos_ in allowed_postags])
    return texts_out

# Part of Speech tagging for lemmatization
pos_tags = nltk.pos_tag(tokens)
tokens_lemmatized = lemmatization(tokens, allowed_postags=['NOUN', 'ADJ', 'VERB', 'ADV'])

print("complete preprocessing")

# Create Gensim Dictionary
id2word = Dictionary(tokens_lemmatized)

# Create Gensim Corpus
gensim_corpus = [id2word.doc2bow(text) for text in tokens_lemmatized]

print("complete define dict and corpus")

# Initialize an empty list to store coherence values
coherence_values = []

# Iterate over different numbers of topics
malletPath = 'C:/Users/diego/Downloads/mallet-2.0.8/mallet-2.0.8/bin/mallet'
for num_topics in range(5,26):
    # Train the Mallet LDA model
    lda_mallet_model = LdaMallet(
        mallet_path= malletPath,  # Specify the path to your Mallet executable
        corpus=gensim_corpus,
        id2word=id2word,
        num_topics=num_topics
    )

    # Compute coherence score
    coherence_model = CoherenceModel(
        model=lda_mallet_model,
        texts=[tokens],  
        dictionary=id2word,
        coherence='u_mass'
    )

    coherence_values.append(coherence_model.get_coherence())

# Plot the coherence values
plt.plot(range(5,26), coherence_values, marker='o')
plt.xlabel('Number of Topics')
plt.ylabel('Coherence Score (u_mass)')
plt.title('Coherence Scores for Mallet LDA Model')
plt.show()

print("chart complete")
