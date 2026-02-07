/*
  # Create memories table for Valentine's website

  1. New Tables
    - `memories`
      - `id` (uuid, primary key)
      - `image_url` (text, URL to stored image)
      - `caption` (text, message or memory description)
      - `created_at` (timestamp)

  2. Security
    - Enable RLS on `memories` table
    - Allow public read access
    - Allow public insert (for uploading memories)
*/

CREATE TABLE IF NOT EXISTS memories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  image_url text NOT NULL,
  caption text,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE memories ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view memories"
  ON memories FOR SELECT
  USING (true);

CREATE POLICY "Anyone can add memories"
  ON memories FOR INSERT
  WITH CHECK (true);
