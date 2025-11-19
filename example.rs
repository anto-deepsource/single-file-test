impl Processor {
    /// Fetch edge features based on `input` struct into [`Features`] buffer.
    pub fn fetch_features(
        &mut self,
        input: &dyn BotsInput,
        features: &mut Features,
    ) -> Result<(), (ErrorFlags, i32)> {
        // update features checksum (lower 32 bits) and copy edge feature names
        features.checksum &= 0xFFFF_FFFF_0000_0000;
        features.checksum |= u64::from(self.config.checksum);        
        let (feature_values, _) = features
            .append_with_names(&self.config.feature_names)
            .unwrap(); 

        // Added to satisfy the function signature
        Ok(())
    }
}
